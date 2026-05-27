🚀 Highly Available Web Application on AWS
Show Image
Show Image
Show Image
Show Image
Show Image
Show Image
Show Image

A production-grade, highly available and scalable web application infrastructure built on AWS using a multi-AZ VPC architecture — following AWS best practices for security, scalability, and fault tolerance.


📐 Architecture Diagram
Show Image
🔄 Traffic Flow
Internet → Internet Gateway → Application Load Balancer → Auto Scaling Web Servers (Private Subnets)
🔐 SSH Access Flow
Local Machine → Bastion Host (Public Subnet) → Private Web Servers

🛠️ AWS Services Used
ServicePurpose🌐 Amazon VPCNetwork isolation🔀 Public & Private SubnetsMulti-tier architecture🚪 Internet GatewayInternet access for public subnets🔁 NAT GatewayOutbound internet for private instances💻 Amazon EC2Web servers and Bastion Host⚖️ Application Load BalancerTraffic distribution across AZs📈 Auto Scaling GroupAutomatic instance scaling💾 Amazon EBSAdditional persistent storage🪣 Amazon S3Backup and log storage📊 Amazon CloudWatchCPU monitoring and scaling triggers🔒 Security GroupsFirewall and access control

🌐 Network Configuration
VPC Details
ComponentValueVPC NameHA-WebApp-VPCCIDR Block10.0.0.0/16Regionap-south-1 (Mumbai)
Subnet Configuration
SubnetAvailability ZoneCIDR BlockTypePublic-Subnet-1ap-south-1a10.0.1.0/24🟢 PublicPublic-Subnet-2ap-south-1b10.0.2.0/24🟢 PublicPrivate-Subnet-1ap-south-1a10.0.3.0/24🔴 PrivatePrivate-Subnet-2ap-south-1b10.0.4.0/24🔴 Private
Route Tables
Route TableDestinationTargetPublic0.0.0.0/0Internet GatewayPrivate0.0.0.0/0NAT Gateway

🔒 Security Configuration
Bastion Host Security Group
RulePortSourceSSH22My Public IP only
Web Server Security Group
RulePortSourceSSH22Bastion Security GroupHTTP80ALB Security Group

✅ Private instances have no public IP addresses
✅ SSH access only through Bastion Host
✅ Internet traffic only through ALB


⚖️ Load Balancer & Auto Scaling
ALB Configuration
SettingValueTypeInternet-facingListenerHTTP on Port 80Availability Zonesap-south-1a, ap-south-1bHealth Check Path/
Auto Scaling Group
SettingValueMinimum Instances2Desired Instances2Maximum Instances4Scaling MetricCPU UtilisationScale-out Threshold60%

💾 Storage
EBS Volume
bashlsblk
sudo mkfs -t xfs /dev/nvme1n1
sudo mkdir /data
sudo mount /dev/nvme1n1 /data
sudo blkid
sudo mount -a
S3 Backup
bashtar -czvf backup.tar.gz /var/www/html
aws s3 cp backup.tar.gz s3://buck2128/
aws s3 cp /var/log/httpd/access_log s3://buck2128/
aws s3 ls s3://buck2128/

📁 Repository Structure
aws-ha-webapp/
├── README.md
├── diagrams/
│   └── architecture.png
├── scripts/
│   ├── webserver_setup.sh
│   ├── userdata.sh
│   ├── ebs_mount.sh
│   ├── s3_backup.sh
│   └── stress_test.sh
└── docs/
    └── project_report.md

🧪 Scaling Test Results
bashsudo dnf install stress -y
stress --cpu 2 --timeout 300
ResultStatusCPU crossed 60% threshold✅ASG launched new instances✅New instances passed health checks✅ALB distributed traffic successfully✅

🧠 Problems Faced & Solutions
ProblemSolutionEBS volume not detectedVerified with lsblk before formattingSSH to private instance failedUsed Bastion Host with SSH agent forwardingALB health check failingRestarted Apache and enabled it on bootS3 upload permission deniedConfigured AWS CLI with aws configureASG instances unhealthyFixed User Data script and Security Group rules

✅ Key Outcomes

🏗️ Multi-AZ architecture for fault tolerance
🔐 Secure multi-tier network design
⚖️ Load balancing across Availability Zones
📈 Automatic scaling based on CPU utilisation
💾 Backup and recovery using EBS snapshots and S3
📊 Scaling validated using CloudWatch metrics


👤 Author
Eldho Sabu
AWS DevOps Learner | IT Graduate | ap-south-1 (Mumbai)
Show Image
Show Image


⭐ If you found this project useful, please consider starring the repository!
