#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx

# Put a simple index.html so we know which instance served the request
echo "<h1>Welcome to EC2 instance $(hostname)</h1>" > /usr/share/nginx/html/index.html