#!/bin/bash
lsblk
sudo mkfs -t xfs /dev/nvme1n1
sudo mkdir /data
sudo mount /dev/nvme1n1 /data
sudo blkid
sudo mount -a
echo "EBS volume mounted at /data"