import requests
from datetime import datetime, timedelta,timezone
import smtplib
import jenkins_cron_config

# {
#     "_class": "hudson.model.FreeStyleProject",
#     "name": "Backups_Incremental",
#     "buildable": true,
#     "color": "blue"
# },
jenkin_root="https://jenkins-cron.vietnamworks.com"
auth=('tuonghv', '11c3a2cab5285ed4f4ce41de41ad290b1e')
# notification_gw = 'http://172.16.4.54:5550/'
notification_gw = 'http://172.16.4.54:5550/nagios_newdc'
jenkins_info_url ="https://navigosgroup.webhook.office.com/webhookb2/879882ef-7933-456d-ad94-877b2175ebf0@3b757257-990f-4253-aca4-ba5be9e05cca/IncomingWebhook/c27866b8691b4a0ab4fef502a37ce011/0671d66e-c546-41cf-911a-1970ba2b138c"
miliseconds_checkpoint = 0
thislist = []
thislist_report = []

mute_alert_jobs = jenkins_cron_config.mute_alert_jobs

def get_last_build(job):
    url = jenkin_root+ job['path'] + 'lastBuild/api/json?tree=result,timestamp,estimatedDuration'
    response = requests.post(url, auth=auth)
    data = response.json()
    timestamp=data["timestamp"]
    if timestamp > miliseconds_checkpoint:
        # print("new")
        job_lastbuild = datetime.fromtimestamp(timestamp / 1000.0)
        lastBuild = job_lastbuild.strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
        job_failure = {
            "name": job['name'],
            "path": job['path'],
            "lastBuild": lastBuild
        }
        thislist_report.append(job_failure)
        return True
    else:
        # print("old")
        return False

def process_job_list(data,path):
    for job in data:
        process_job_Object(job,path)

def process_job_Object(data, path):
    if data['_class'] == 'hudson.model.Hudson':
        process_job_list(data['jobs'],path)
    elif data['_class'] == 'com.cloudbees.hudson.plugins.folder.Folder':
        path = path + "job/" + data['name']+ "/"
        process_job_list(data['jobs'],path)
    else:
        if data['color'] == 'red':
            path = path + "job/" + data['name'] + "/"
            job_failure = {
                "name": data['name'],
                "path": path,
            }
            if data['name'] not in mute_alert_jobs :
                thislist.append(job_failure)

def alert_failure_job():
    for job in thislist:
        get_last_build(job)
    s = ""
    msg_short = ""
    for job in thislist_report:
        s += "\n-------------------------------"
        msg_short += "\n-------------------------------"
        print("-------------------------------")
        # print("path: " + path)
        s += "\njob: " + job['name']
        msg_short += "\njob: " + job['name']

        print("\nname: " + job['name'])
        s += "\nlastBuild: " + job['lastBuild']
        msg_short += "\nlastBuild: " + job['lastBuild']
        print("lastBuild: " + job['lastBuild'])
        s += "\npath: " + jenkin_root + job['path']
        print("path: " + jenkin_root + job['path'])

    if len(thislist_report)>0:
        send_alert(s, msg_short)
    else:
        print("No alert")
def send_alert(msg, msg_short):
    sender = 'jenkins-cron@vnhcmvt-jenkins.localdomain'
    receivers = ['IT Data System <tuong.huynh@navigosgroup.com>']
    receivers = ['Huynh Van Tuong <tuong.huynh@navigosgroup.com>']

    try:
        print("start send email")
        smtpObj = smtplib.SMTP('10.122.4.204')

        subject="Jenkins cron failure job " + datetime.now().strftime('%Y-%m-%d')
        message = 'Subject: {}\n\n{}'.format(subject, msg)
        smtpObj.sendmail(sender, receivers, message)
        print("send email done")
    except:
        print("send failure")

    try:
        data = {"title": "Jenkins cron failure job", "text": msg_short}
        print("start send notification")
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        x = requests.post(notification_gw, json=data, headers=headers)
        print(x.text)
    except:
        print("send notification failure")

    try:
        data = {"title": "Jenkins cron report - failure job", "text": msg_short}
        print("start send notification")
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        x = requests.post(jenkins_info_url, json=data, headers=headers)
        print(x.text)
    except:
        print("send notification failure")

    


def get_job_status():
    url = jenkin_root+ '/api/json?tree=jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable]]]]]&pretty'
    response = requests.post(url, auth=auth)
    data = response.json()
    # print(data)
    process_job_Object(data,"/")

if __name__ == '__main__':
    date_N_days_ago = datetime.now() - timedelta(days=1)
    miliseconds_checkpoint = date_N_days_ago.timestamp() * 1000
    print("miliseconds_checkpoint: " + str(miliseconds_checkpoint))
    print(date_N_days_ago.strftime('%Y-%m-%d %H:%M:%S.%f')[:-3])
    get_job_status()
    alert_failure_job()




import requests
from requests.auth import HTTPBasicAuth

auth=('tuonghv', '11c3a2cab5285ed4f4ce41de41ad290b1e')
jenkin_root="https://jenkins-cron.vietnamworks.com"
url = jenkin_root+ '/api/json?tree=jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable,jobs[name,color,buildable]]]]]&pretty'

print(url)
requests.post(url,auth = HTTPBasicAuth(auth[0], auth[1]))