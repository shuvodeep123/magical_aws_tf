#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Compliant HA Web App</h1><p>Environment: ${environment_name}</p>" > /var/www/html/index.html