#!/bin/bash
dnf update -y
dnf install httpd -y
systemctl enable httpd
systemctl start httpd
echo "Web Server from Auto Scaling Group" > /var/www/html/index.html