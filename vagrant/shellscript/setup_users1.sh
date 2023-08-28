#!/usr/bin/env bash

# Thiết lập tên người dùng và mật khẩu
USERNAME="ubuntu1"
PASSWORD="ubuntu1"

# Tạo người dùng
useradd -m -s /bin/bash $USERNAME

# Đặt mật khẩu cho người dùng
echo "${USERNAME}:${PASSWORD}" | chpasswd

# Cho phép người dùng truy cập sudo bằng cách thêm vào nhóm sudo
usermod -aG sudo $USERNAME

# Tắt việc yêu cầu mật khẩu khi sử dụng sudo (tuỳ chọn)
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

# Thêm khóa công khai SSH
mkdir -p /home/ubuntu1/.ssh
chmod 700 /home/ubuntu1/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtTy+33L4YoKhyX0tuhelRJYizH5NrAJFBD/9dtjolM62YB8Mhs0FJtmEIjvtqrjjIkhMKB7UCqYsIRKHhLh10Pmtio4LaWJ+8oDtwJlMv5hovpnBfRlpSaszr/2MHId5F4hNt5ssz9qs5YBgY1AbEcqwwJZ5boFwDWKPUzfID4tZf6+GBHx+S0yLv+sGqFAk8KSk3UfRqibIHF/A/+0JlpJiHvtDIoNzwdX77sAesbGAWn6B+4RnFj7WYLmMuU9XF3/JkfVVq3SSPJHSkkJWRjkfOz5MIsnMwv4pGMsQ1D+Vl4bktPbf9MCFmlUDq2GN6o1P11ZuQrsyOxuoQiK3vxL58S/oBmkBwHNuXriMaSg18dqAaizS5VxyPo6haR8I4+Tbha5BVwHv5+S4GTNL4gL2FCcW1r0pAnMeQVSeYEshmSFNaUVvSQqlgBzS1l5O5Yp+1UPU/tFE1ZIrZoiPLxvyRnw7s+PMQc5VNiZqMQKJMOwLxGZN7RGOIZAA0MxM= black@dangnguyen' >> /home/ubuntu1/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfgWpcClXIKGxUHHIvY0l9a/7B6O0qa6TgYmtVMp4vJfCTNB6kFdrBQssKjixRg8gm6NApkxCl42w6nKrzmOlJY7KcYZMM2A+w26yOA+Cksrxjzvlr0T9KAUy6OtmfxlXn6OtMopdbV6SZ2nxS+KIEh96YH2Dswd+1Qk8UhzWtA3CGGhlh9Vaogop7Cm++lJnaNioIwziXYWw64I9cr6kg7+kcIVxmAnYq8k/0WKgTvLIOZv+oTMX63ADGMiM0lc1bK1gBnZRXliou3oETkHBKZf/lAiR0XPNCrAgwpq7Q1mCchXOas6Z8DWy5Gl9TxffKqyKwLMSvjL9YHG7PG9QH0KhRDZncz1JClGtuSQKpwJhvTcIJ9jlgEXKQUhLj142JFdFcZx0gJciD8M0FVlzBWwBvfQtfKmNFHRsIB5ROfs63w9XTSYh3ET+lCxmDaCB0zzkPBMx8+/6a1Z9JHRyKNlgUluS2JV/tKeowQXDAr1fPXPFENnnPzmexeESQZXM= root@dangnguyen' >> /home/ubuntu1/.ssh/authorized_keys
chmod 600 /home/ubuntu1/.ssh/authorized_keys
chown -R ubuntu1:ubuntu1 /home/ubuntu1/.ssh