#!/bin/bash
sudo dnf install stress -y
stress --cpu 2 --timeout 300
echo "Stress test complete. Check CloudWatch and ASG Activity."