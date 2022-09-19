1006  sudo iptables -S
1007  sudo iptables -L --line-numbers
1008  systemctl | grep ipta
1009  iptables -I INPUT 4 -p tcp -m tcp --dport 5666 -j ACCEPT


iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 4000 -j ACCEPT

sudo /sbin/iptables-save > /etc/sysconfig/iptables