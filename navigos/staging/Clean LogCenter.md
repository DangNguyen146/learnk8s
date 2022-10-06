+ staging+ release

copy: https://jenkins-cron.vietnamworks.com/job/Production/job/Schedules/job/system/job/Clean_LogCenter/configure


First 1: Create project in Jenkins

Second 2: Create file on project gitlab Jenkins

Third: Copy source

Jenkins: 172.16.4.25

docker exec -it --user ngosadm dcbb2b9e32da bash


echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhIGg5HIA62ssGZKxlvdE7trhOsvU3uGiHhz0HWzYYD33ljpsU7iqS6F8RsDpU6Zg6H5bgbotTEzFOfl4GaWanP0vE2iJZOHQazmH72ssX3B8B6jZ7/D4kmTsSpqoB6V7KkLTFJ+41Wqgo1tTwr2x6iBO3DPCRb3NRVlRo18X+AQDQIlyRLMBjFPgygi9aESks04lvuuEdmi4qkLVBksT0TR+ldrNS1ZDtcAjVk1Cb4Of5SZw4gb52EbJ0Z9JE3Y84TGOigdPMMo3XsV4Oq0jrnaWKKJzfdrRtlhxZL5v+0bUyTnnKaKdJnFDmd8nFbcjrOF0UCHmaaqlzcW1NsjbJ jenkins@dcbb2b9e32da' >> authorized_keys

echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmfBnAFirE0YrxbiDxIva7jMS1jAOdKKU7f3BZJLqPCf52apFxBxFPZeKV04XzWjisMX1lBJ5ZJF6IQM490nUY7Li0jhZZSG8lh6akJu51Uzb2nakg/ZvLakCN1QE6XmDt9SaZqDOC7wKPjhHtUKo1qHTNrHLrbZbUlOtJwMOJ64moVqe8pnuKa0VroXctGkzB45KY0geSO0B9lsRzHF2v9cnQF/xEcJPXL37j4UQaa+gqJvNEid+AwOmkn73zKqs4bGFO5VKgQnoIXNnP97Wo8BX4qKLOwf8d3+AubWoZ8nvVAMJzNPFyh41jj9C0XqBkYWfVKWR0yI+C+f0eQhh/ jenkins@bb57e9ae77dd' >> /home/ngosadm/.ssh/authorized_keys

![](../img/2022-10-03-17-44-03.png)

add user
visudo

# create user
sudo su -
sudo adduser ngosadm
su ngosadm
chmod go-w ~/
mkdir  ~/.ssh
chmod 700 ~/.ssh
echo "sh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz4oo6RP7CQKsB/EhF/Bvdd1+2W7srxHHmiD5UTz9NHpfmQyv9b6twIncnf6KBavXx1Ua7pRlMSuPqhtETNPRv95efOn8OK7+S0HjguFX9Oj45T3rwONPrLVDacDpTxVxd3PDocv4OUG98+0qV3d7KG3qToQDzV6EdCWnObYfM2TO4XU5v7h083dwmhCpgj1P5E1LIreOSRLjE0QRNUd9WYNXbjVlZHXGoXl0JI5p+KeSD4Bkic/V1xX/cOfwxI7mxkYxVqDFl+SVsYTAMtUv1Z3Sez1exOpwArnzR1Vrmf6cLFrKFpyDp8ydLqaG9cRueQeUHfN/8yFf1jOTPOBLT root@d2ca9f27434c" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
