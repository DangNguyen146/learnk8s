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
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtTy+33L4YoKhyX0tuhelRJYizH5NrAJFBD/9dtjolM62YB8Mhs0FJtmEIjvtqrjjIkhMKB7UCqYsIRKHhLh10Pmtio4LaWJ+8oDtwJlMv5hovpnBfRlpSaszr/2MHId5F4hNt5ssz9qs5YBgY1AbEcqwwJZ5boFwDWKPUzfID4tZf6+GBHx+S0yLv+sGqFAk8KSk3UfRqibIHF/A/+0JlpJiHvtDIoNzwdX77sAesbGAWn6B+4RnFj7WYLmMuU9XF3/JkfVVq3SSPJHSkkJWRjkfOz5MIsnMwv4pGMsQ1D+Vl4bktPbf9MCFmlUDq2GN6o1P11ZuQrsyOxuoQiK3vxL58S/oBmkBwHNuXriMaSg18dqAaizS5VxyPo6haR8I4+Tbha5BVwHv5+S4GTNL4gL2FCcW1r0pAnMeQVSeYEshmSFNaUVvSQqlgBzS1l5O5Yp+1UPU/tFE1ZIrZoiPLxvyRnw7s+PMQc5VNiZqMQKJMOwLxGZN7RGOIZAA0MxM= black@dangnguyen' >> /home/ubuntu2/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCcQtbpdbSxDB6x7uiRMoyIZaowxXfskSBBcsz1BnTBd7vv7HAhLLFpSNXnzUHYs3485zr9KuL6MgWba8BV+PANmMIbCkypC2iL3mzi9cog98T23nhUVn55CpL2ItsxXgCV7N1TIca43oCklXgLYmAfWipwu03kPoVPqeLow6GiFBS1dhg77mUaTa4xg9xtEGl+r4QYgbKlLR00JlBl3sP7ljRNs4BN37+4eLghv8wNAsrmPsd5zKFS8XNq+It6Pbuuy3qwMgjKQxPQxBt94fttWXsc70/ysPN/MROjx/EaHzkT9SlYNQgWRAmdSXXQ6jsy/dDF2JYgKP1cpZL/TkcOfmGbGYVpvA/Hop/edFCP1nfvVrdMfrZsRIJjEYhIau+niYkDQ4kxsommjmcldXI1uYeRF0SLzS78E7E6UmxkxwsJ70AdkO9QabvdqUXOgwA3DfmgXtzk+jB08+XHVahhQ8dCuUMf3tgb6aJAJ0RkVAJ61ckN0pWMWYED7Pb48hc= root@dangnguyen' >> /home/ubuntu2/.ssh/authorized_keys
chmod 600 /home/ubuntu2/.ssh/authorized_keys
chown -R ubuntu2:ubuntu2 /home/ubuntu2/.ssh