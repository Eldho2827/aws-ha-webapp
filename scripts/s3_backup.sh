#!/bin/bash
tar -czvf backup.tar.gz /var/www/html
aws s3 cp backup.tar.gz s3://buck2128/
aws s3 cp /var/log/httpd/access_log s3://buck2128/
aws s3 ls s3://buck2128/
echo "Backup complete."