#!/bin/bash
#Restricting access to kernel logs. 
sudo echo "kernel.dmesg_restrict = 1" >> /etc/sysctl.d/50-dmesg-restrict.conf
# Restricting access to kernel pointers. 
sudo echo "kernel.kptr_restrict = 1" >> /etc/sysctl.d/50-kptr-restrict.conf
# ExecShield protection. 
sudo echo "kernel.exec-shield = 2" >> /etc/sysctl.d/50-exec-shield.conf
# Randomise memory space. 
sudo echo "kernel.randomize_va_space = 2" >> /etc/sysctl.d/50-rand-va-space.conf
# Ensure syslog service is enabled and running. 
sudo systemctl enable rsyslog.service
sudo systemctl start rsyslog.service
# Enable TCP SYN Cookie protection. 
sudo echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.d/50-net-stack.conf
# Disable IP source routing. 
sudo echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/50-net-stack.conf
# Disable ICMP redirect acceptance. 
sudo echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/50-net-stack.conf
# Enable ignoring to ICMP requests. 
sudo echo "net.ipv4.icmp_echo_ignore_all = 1" >> /etc/sysctl.d/50-net-stack.conf
# Enable ignoring broadcasts request. 
sudo echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.d/50-net-stack.conf
