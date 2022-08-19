### Hot to do it?
Env: staging+ release
Copy script from nagios production: 

 - production/objects/navigosGroup/BackendService/vnw-access.cfg
 - production/objects/navigosGroup/BackendService/vnw-api-access.cfg
 - production/objects/navigosGroup/BackendService/vnw-error.cfg
 - production/objects/navigosGroup/BackendService/kong_access.cfg

Elastich:
 - Pro: 10.122.4.54
 - Release: 172.16.4.47
 - Staging: 172.16.5.47
Nagios:
 - Release: 172.16.4.72
 - Staging: 172.16.5.43

4NC6Qnh3LgP6
lxf.R6s-BICT

## Step 1: Copy and edit ip centerlog
                    LogCenter		Kibana
    172.16.5.91 —> 172.16.5.75 —> 172.16.5.47
    172.16.5.92

                        LogCenter		Kibana
    172.16.4.91 —> 172.16.4.75 —> 172.16.4.47
    172.16.4.92
## Step 2: Edit file python -> Note: ip kibana
/bin/python3.6 -m pip install elasticsearch==7.17.3