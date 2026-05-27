# 🚀 Highly Available Web Application on AWS

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws&logoColor=white)
![EC2](https://img.shields.io/badge/Amazon%20EC2-Compute-blue?logo=amazon-ec2&logoColor=white)
![VPC](https://img.shields.io/badge/Amazon%20VPC-Network-purple?logo=amazon-aws&logoColor=white)
![ALB](https://img.shields.io/badge/Load%20Balancer-Active-green?logo=amazon-aws&logoColor=white)
![Auto Scaling](https://img.shields.io/badge/Auto%20Scaling-Enabled-brightgreen?logo=amazon-aws&logoColor=white)
![S3](https://img.shields.io/badge/Amazon%20S3-Storage-red?logo=amazon-s3&logoColor=white)
![Status](https://img.shields.io/badge/Project%20Status-Completed-success)

> A production-grade, highly available and scalable web application infrastructure built on AWS using a multi-AZ VPC architecture — following AWS best practices for security, scalability, and fault tolerance.

---

## 📐 Architecture Diagram

![Architecture Diagram](https://raw.githubusercontent.com/Eldho2827/aws-ha-webapp/main/diagrams/architecture.png)

### 🔄 Traffic Flow

```
Internet → Internet Gateway → Application Load Balancer → Auto Scaling Web Servers (Private Subnets)
```

### 🔐 SSH Access Flow

```
Local Machine → Bastion Host (Public Subnet) → Private Web Servers
```

---

## 🛠️ AWS Services Used

| Service | Purpose |
|---|---|
| 🌐 Amazon VPC | Network isolation |
| 🔀 Public & Private Subnets | Multi-tier architecture |
| 🚪 Internet Gateway | Internet access for public subnets |
| 🔁 NAT Gateway | Outbound internet for private instances |
| 💻 Amazon EC2 | Web servers and Bastion Host |
| ⚖️ Application Load Balancer | Traffic distribution across AZs |
| 📈 Auto Scaling Group | Automatic instance scaling |
| 💾 Amazon EBS | Additional persistent storage |
| 🪣 Amazon S3 | Backup and log storage |
| 📊 Amazon CloudWatch | CPU monitoring and scaling triggers |
| 🔒 Security Groups | Firewall and access control |

---

## 🌐 Network Configuration

### VPC Details

| Component | Value |
|---|---|
| VPC Name | HA-WebApp-VPC |
| CIDR Block | 10.0.0.0/16 |
| Region | ap-south-1 (Mumbai) |

### Subnet Configuration

| Subnet | Availability Zone | CIDR Block | Type |
|---|---|---|---|
| Public-Subnet-1 | ap-south-1a | 10.0.1.0/24 | 🟢 Public |
| Public-Subnet-2 | ap-south-1b | 10.0.2.0/24 | 🟢 Public |
| Private-Subnet-1 | ap-south-1a | 10.0.3.0/24 | 🔴 Private |
| Private-Subnet-2 | ap-south-1b | 10.0.4.0/24 | 🔴 Private |

### Route Tables

| Route Table | Destination | Target |
|---|---|---|
| Public | 0.0.0.0/0 | Internet Gateway |
| Private | 0.0.0.0/0 | NAT Gateway |

---

## 🔒 Security Configuration

### Bastion Host Security Group

| Rule | Port | Source |
|---|---|---|
| SSH | 22 | My Public IP only |

### Web Server Security Group

| Rule | Port | Source |
|---|---|---|
| SSH | 22 | Bastion Security Group |
| HTTP | 80 | ALB Security Group |

> ✅ Private instances have no public IP addresses
> ✅ SSH access only through Bastion Host
> ✅ Internet traffic only through ALB

---

## ⚖️ Load Balancer & Auto Scaling

### ALB Configuration

| Setting | Value |
|---|---|
| Type | Internet-facing |
| Listener | HTTP on Port 80 |
| Availability Zones | ap-south-1a, ap-south-1b |
| Health Check Path | / |

### Auto Scaling Group

| Setting | Value |
|---|---|
| Minimum Instances | 2 |
| Desired Instances | 2 |
| Maximum Instances | 4 |
| Scaling Metric | CPU Utilisation |
| Scale-out Threshold | 60% |

---

## 💾 Storage

### EBS Volume

```bash
lsblk
sudo mkfs -t xfs /dev/nvme1n1
sudo mkdir /data
sudo mount /dev/nvme1n1 /data
sudo blkid
sudo mount -a
```

### S3 Backup

```bash
tar -czvf backup.tar.gz /var/www/html
aws s3 cp backup.tar.gz s3://buck2128/
aws s3 cp /var/log/httpd/access_log s3://buck2128/
aws s3 ls s3://buck2128/
```

---

## 📁 Repository Structure

```
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
```

---

## 🧪 Scaling Test Results

```bash
sudo dnf install stress -y
stress --cpu 2 --timeout 300
```

| Result | Status |
|---|---|
| CPU crossed 60% threshold | ✅ |
| ASG launched new instances | ✅ |
| New instances passed health checks | ✅ |
| ALB distributed traffic successfully | ✅ |

---

## 🧠 Problems Faced & Solutions

| Problem | Solution |
|---|---|
| EBS volume not detected | Verified with `lsblk` before formatting |
| SSH to private instance failed | Used Bastion Host with SSH agent forwarding |
| ALB health check failing | Restarted Apache and enabled it on boot |
| S3 upload permission denied | Configured AWS CLI with `aws configure` |
| ASG instances unhealthy | Fixed User Data script and Security Group rules |

---

## ✅ Key Outcomes

- 🏗️ Multi-AZ architecture for fault tolerance
- 🔐 Secure multi-tier network design
- ⚖️ Load balancing across Availability Zones
- 📈 Automatic scaling based on CPU utilisation
- 💾 Backup and recovery using EBS snapshots and S3
- 📊 Scaling validated using CloudWatch metrics

---

## 👤 Author

**Eldho Sabu**
AWS DevOps Learner | IT Graduate

[![GitHub](https://img.shields.io/badge/GitHub-Eldho2827-black?logo=github&logoColor=white)](https://github.com/Eldho2827)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Eldho%20Sabu-blue?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/eldhosabu08)

---

> ⭐ If you found this project useful, please consider starring the repository!
