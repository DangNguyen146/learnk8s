#### Nagios last sync time

### Command
 - Release:
        check_api_v2_GET!15!job-detail!"https://release-api.vietnamworks.com/api/rest/v3/jobs/1364321"
            >> check_api_v2_GET!15!job-detail!https://release-api.vietnamworks.com/api/rest/v3/jobs

 - Staging:
        check_api_v2_GET!15!job-detail!https://api.vietnamworks.com/api/rest/v3/jobs/1529426
            >> check_api_v2_GET!15!job-detail!https://api-staging.vietnamworks.com/api/rest/v3/jobs

### Redis ip
        10.122.4.43
        database: 1
### Command run and logs
        127.0.0.1:6379[1]> get lsyncd_vnworks_images_lastsync "Aug 15 17:05:29 2022"
        127.0.0.1:6379[1]> get lsyncd_vnworks_images_status "0"
        127.0.0.1:6379[1]> get images01_to_aws_lastsync "1660557872" > unix time
        127.0.0.1:6379[1]> get images01_to_aws_status "23"
        
        monitor status: code "0" or "23": OK other is Warning
        monitor lastsync: over 15 minutes: warning, over 1 hour is critical