import sys
import datetime
import os
import requests
from elasticsearch import Elasticsearch
from requests.exceptions import RequestException
from requests.packages.urllib3.exceptions import InsecureRequestWarning
import redis

ms_teams_theme_color = "#6600ff"
ms_teams_webhook_url = "https://navigosgroup.webhook.office.com/webhookb2/879882ef-7933-456d-ad94-877b2175ebf0@3b757257-990f-4253-aca4-ba5be9e05cca/IncomingWebhook/6db0b64e35594dff915ac3adc52302ca/0671d66e-c546-41cf-911a-1970ba2b138c"

kibana_index = "http://172.16.5.47:5601/app/dashboards#/view/2b756980-8d5e-11ec-b8b4-f5a8662b378f?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-20m,to:now))&_a=(description:'',filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:f6ff50b0-8ca6-11ec-b8b4-f5a8662b378f,key:Name.keyword,negate:!f,params:(query:webservices-v2),type:phrase),query:(match_phrase:(Name.keyword:webservices-v2))),('$state':(store:appState),meta:(alias:!n,disabled:!f,index:f6ff50b0-8ca6-11ec-b8b4-f5a8662b378f,key:host.keyword,negate:!f,params:(query:vStaging-Rancher02),type:phrase),query:(match_phrase:(host.keyword:vStaging-Rancher02)))),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:''),tags:!(),timeRestore:!f,title:Docker,viewMode:view)"

redis_ttl = 86400
redis_ttl_count_err = 120
threshold_count = 1
client = redis.Redis(host='172.16.5.43', port=6379, db=3)

def redis_setkey(key, value, ttl):
    client.set(key, value)
    client.expire(key, ttl)


def redis_getkey(key):
    return client.get(key)


def redis_key_exists(key):
    keyvalue = client.get(key)
    if keyvalue is None:
        return False
    return True

def check_alert_threshold(key):
    app_key ="count_err_" + key
    error_count=0
    get_err=redis_getkey(app_key)
    if get_err is None:
        print("get_err is none")
        error_count=1
    else:
        error_count=int(get_err)+1
        print("error_count++ : %s" % str(error_count) )

    redis_setkey(app_key, str(error_count), redis_ttl_count_err)

    if error_count >= threshold_count:
        return True
    return False


def send_alert(title, detail, kibana):
    headers = {'content-type': 'application/json'}
    # payload = {
    #     '@type': 'MessageCard',
    #     '@context': 'http://schema.org/extensions',
    #     'summary': title,
    #     'title': title,
    #     'themeColor': ms_teams_theme_color,
    #     'text': detail
    # }

    payload = {
        "@context": "http://schema.org/extensions",
        "@type": "MessageCard",
        "potentialAction": [
            {
                "@context": "http://schema.org",
                "@type": "OpenUri",
                "name": "View Kibana..",
                "targets": [
                    {
                        "os": "default",
                        "uri": kibana
                    }
                ]
            }
        ],
        "sections": [
            {
                "text": detail,
                "title": "Details"
            }
        ],
        "summary": title,
        "themeColor": ms_teams_theme_color,
        "title": title
    }
    try:
        response = requests.post(ms_teams_webhook_url, headers=headers, json=payload)
        print("alert was sent")
    except RequestException as e:
        print("error send message to microsoft teams %s" % e)


def get_query_sevice_group_host(name):
    filter="MemPerc:>95 AND Name.keyword:\"%s\"" % name
    myquery = {
    "size": 0,
    "query": {

        "bool": {
            "filter": [
                {
                    "range": {
                        "@timestamp": {
                            "time_zone": "+07:00",
                            "gte": "now-20m",
                            "lt": "now"
                        }
                    }
                }
            ],
            "must": [
                {
                    "query_string": {
                        "query": filter
                    }
                }
            ]
        }
    },

    "aggs": {
        "by_Name": {
            "terms": {
                "field": "host.keyword",
                "size": 50
            }
        }
    }

}
    return myquery

def query_httperror():
    try:
        # print("connect ES with password.")
        es = Elasticsearch("%s://%s:%s" % ("http", "172.16.5.47", "9200"),
                           http_auth=("td-agent", "aJtK29az9mzTSMi"), use_ssl=False,
                           verify_certs=False, timeout=100)
        # print("connected ES.")
    except:
        print("error connect ES.")
        return False


    query_count = {
        "query": {
            "bool": {
                "filter": [
                    {
                        "range": {
                            "@timestamp": {
                                "time_zone": "+07:00",
                                "gte": "now-20m",
                                "lt": "now"
                            }
                        }
                    }
                ],
                "must": [
                    {
                        "query_string": {
                             "query": "MemPerc:>95"
                        }
                    }
                ]
            }
        }
    }

    query_top = {
        "size": 0,
        "query": {

            "bool": {
                "filter": [
                    {
                        "range": {
                            "@timestamp": {
                                "time_zone": "+07:00",
                                "gte": "now-20m",
                                "lt": "now"
                            }
                        }
                    }
                ],
                "must": [
                    {
                        "query_string": {
                           "query": "MemPerc:>95"
                        }
                    }
                ]
            }
        },

        "aggs": {
            "by_Name": {
                "terms": {
                    "field": "Name.keyword",
                    "size": 50
                }
            }
        }

    }

    try:
        body_search = query_count
        rs = es.count(index="docker_stats-*", doc_type="_doc", body=body_search)
        print(rs['count'])

        if rs['count'] > 4:
            body_search = query_top
            rs = es.search(index="docker_stats-*", doc_type="_doc", body=body_search)
            print(rs)
            total = rs["hits"]["total"]["value"]
            print(total)
            buckets = rs["aggregations"]["by_Name"]["buckets"]

            print(buckets)
            for bucket in buckets:
                # print(bucket)
                name = bucket["key"]
                key = name
                service_name = name
                print("Name:" + name)
                count = bucket["doc_count"]


                ## only alert for upstream got 6 errors in 5 minutes
                if count >= 3:


                    ############################
                    alert = False

                    body_search = get_query_sevice_group_host(name)
                    print(body_search)
                    rs = es.search(index="docker_stats-*", doc_type="_doc", body=body_search)
                    print(rs)
                    total = rs["hits"]["total"]["value"]
                    print(total)
                    buckets = rs["aggregations"]["by_Name"]["buckets"]

                    print(buckets)
                    host = ""
                    for bucket in buckets:
                        # print(bucket)
                        name = bucket["key"]
                        key = name
                        host = name
                        print("Name:" + name)
                        count = bucket["doc_count"]


                        ## only alert for upstream got 6 errors in 5 minutes
                        if count >= 3:
                            alert = True
                            break                    

                    if not alert:
                        continue
                    ##############################

                    key = service_name
                    alert_level = "is WARNING"
                    # if count >= 14:
                    #     alert_level = "is CRITICAL"

                    # if "hrinsider" in key:
                    #     continue

                    # print(key)
                    redis_key = "alert_docker_stats_memory_" + key
                    status = check_alert_threshold(redis_key)
                    if status:
                        if not redis_key_exists(redis_key):
                            title = "PROBLEM Memory usage service: %s %s" % (key, alert_level)
                            details = "There are more than %s events in service %s" % (str(count), key)
                            kibana = kibana_index.replace("webservices",key)
                            kibana = kibana.replace("vnhcmvt-rancher01",host)
                            send_alert(title, details, kibana)

                            redis_ttl_apply = redis_ttl

                            redis_setkey(redis_key, 1, redis_ttl_apply)


    except Exception as ex:
        print("error elasticsearch count ")
        print(ex)
        return False


if __name__ == '__main__':
    query_httperror()
