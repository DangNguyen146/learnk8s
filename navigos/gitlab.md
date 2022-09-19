### 1. Tạo ssh key:
ssh-keygen -t rsa
### 2. Gitlap
Ldap: prod
email: dang.nguyen@navigosgroup.com
user: dangnk
password: 4NC6Qnh3LgP6
Git url: http://git.navigosgroup.com
git config --global user.name "Nguyen Khai Dnag"
git config --global user.email dang.nguyen@navigosgroup.com
Clone project via ssh: http://git.navigosgroup.com/docker/flask-demo
branch/commit/push test.log file
### 3. Access Server non-prod
    ldap : non-prod
    user: dangnk
    password:  lxf.R6s-BICT
    SSH test vao server:
    172.16.4.54 (non-prod)
### 4. Deploy project 
    Host: 172.16.4.54 
    http://git.navigosgroup.com/docker/flask-demo

### Public key
- cd /Users/dangnk/.ssh/id_rsa.pub 
- cat id_rsa.pub

cp /Users/dangnk/.ssh/id_rsa.pub /Users/dangnk/.ssh/ssh_through
cp /Users/dangnk/.ssh/id_rsa /Users/dangnk/.ssh/ssh_through

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAKr01w/xKIFDLbrCUoHutxKJVaxwGP1J7uTso9U84eQjGcxXv1gww82j9v5u/zy1hv95vULvMqxSiiXUzJ4RqSm2F/ItKr2Rvua3z0wE5MuSkGnqpfAdrX8LWtPSZ06LKoQ7joaLKjSZWaImbVXHFu+k0Cr37lzcsp9DbTWI0EuPFH8LJrOOOHd9MNcOShFf1pBOnEIOevrHaDkdw80NudgeEqgKAfawxzECvDPi4y+ZZf9DeksP5WVM2pCDWKNpihalWzcGaqS9WQEHLvqGrSDjEAR8ZbMh1UV3MuJ5sTNK0D8MbEEi7HV12eHldqMk7PqG2uerAA9ADahP/a7MApjuaqQRH07YemhSAeAVY6xFtozQ9cYpcc9W7YatpsBveLdPhP9zc+zRq8Jwft9/XpUhG1KN3LXB8oPq+lia5jc+8e4rCLZyR8mazNKMsAhdynlrxYMgZuG2Xo8AjtgY8tzoQ9/MSAwhBDK1p3LyA1qkiwIMW+PYSwvgin1NXLHE= dangnk@QC-for-File.local