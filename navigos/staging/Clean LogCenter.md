+ staging+ release

copy: https://jenkins-cron.vietnamworks.com/job/Production/job/Schedules/job/system/job/Clean_LogCenter/configure


First 1: Create project in Jenkins

Second 2: Create file on project gitlab Jenkins

Third: Copy source

Jenkins: 172.16.4.25

docker exec -it --user ngosadm dcbb2b9e32da bash


echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDonERt2tcQxaU/JNlzrtZ/oWYy9apFa5ih/6MfODJMPHU77k5v82+y1boTYAFwkxiBpkFXdpfZv26Xx9sTh+1hdAilwRy6c063UPaay8jPeA+mkewBaqrpd8HXXgXJthYuhNeCv5VHjBAcd0FT2w+Ri4ELfqsWusvo+CVq4atpQ+I7DzuQKr7T6n6BDcsmTIvWGVulF1JvYk/043552LRNeIQbTsbD14akhpzBfDaIUM/O0VlhLuXhmUplv5aB6goCF2MX2r/EDv1126ZxhFmpUEFeHgDzn/sS1SVFhFFnr99u5lZIzhUk2sysQt+6TuEm2dxMSd3t0LcdO4hbv/sX ngosadm@dcbb2b9e32da' >> /home/ngosadm/.ssh/authorized_keys

echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmfBnAFirE0YrxbiDxIva7jMS1jAOdKKU7f3BZJLqPCf52apFxBxFPZeKV04XzWjisMX1lBJ5ZJF6IQM490nUY7Li0jhZZSG8lh6akJu51Uzb2nakg/ZvLakCN1QE6XmDt9SaZqDOC7wKPjhHtUKo1qHTNrHLrbZbUlOtJwMOJ64moVqe8pnuKa0VroXctGkzB45KY0geSO0B9lsRzHF2v9cnQF/xEcJPXL37j4UQaa+gqJvNEid+AwOmkn73zKqs4bGFO5VKgQnoIXNnP97Wo8BX4qKLOwf8d3+AubWoZ8nvVAMJzNPFyh41jj9C0XqBkYWfVKWR0yI+C+f0eQhh/ jenkins@bb57e9ae77dd' >> /home/ngosadm/.ssh/authorized_keys



add user
visudo

# create user
sudo su -
sudo adduser ngosadm
su ngosadm
chmod go-w ~/
mkdir  ~/.ssh
chmod 700 ~/.ssh
echo "" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys