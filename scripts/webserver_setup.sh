#!/bin/bash
sudo dnf update -y
sudo dnf install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "Web Server from Auto Scaling Group" | sudo tee /var/www/html/index.html
echo "Web server setup complete."