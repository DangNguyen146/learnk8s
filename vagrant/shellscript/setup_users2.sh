#!/usr/bin/env bash

# Thiết lập tên người dùng và mật khẩu
USERNAME="ubuntu2"
PASSWORD="ubuntu2"

# Tạo người dùng
useradd -m -s /bin/bash $USERNAME

# Đặt mật khẩu cho người dùng
echo "${USERNAME}:${PASSWORD}" | chpasswd

# Cho phép người dùng truy cập sudo bằng cách thêm vào nhóm sudo
usermod -aG sudo $USERNAME

# Tắt việc yêu cầu mật khẩu khi sử dụng sudo (tuỳ chọn)
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users


# Thêm khóa công khai SSH
mkdir -p /home/ubuntu2/.ssh
chmod 700 /home/ubuntu2/.ssh
echo '' >> /home/ubuntu2/.ssh/authorized_keys
echo '' >> /home/ubuntu2/.ssh/authorized_keys
chmod 600 /home/ubuntu2/.ssh/authorized_keys
chown -R ubuntu2:ubuntu2 /home/ubuntu2/.ssh