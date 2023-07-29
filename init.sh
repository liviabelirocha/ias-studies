#!/bin/bash
cd /home/ubuntu
/bin/echo "<h1>Made with Terraform</h1>" > index.html
nohup busybox httpd -f -p 8080 & 