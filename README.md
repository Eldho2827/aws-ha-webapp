\# Highly Available Web Application on AWS



A highly available and scalable web application infrastructure built on AWS using a multi-AZ VPC architecture.



\## Architecture

!\[Architecture](diagrams/architecture.png)



\## AWS Services Used

\- Amazon VPC

\- Public and Private Subnets (Multi-AZ)

\- Internet Gateway

\- NAT Gateway

\- Amazon EC2

\- Application Load Balancer

\- Auto Scaling Group

\- Amazon EBS

\- Amazon S3

\- Amazon CloudWatch

\- Security Groups



\## Network Configuration

\- VPC CIDR: 10.0.0.0/16

\- Public Subnet 1: 10.0.1.0/24 (ap-south-1a)

\- Public Subnet 2: 10.0.2.0/24 (ap-south-1b)

\- Private Subnet 1: 10.0.3.0/24 (ap-south-1a)

\- Private Subnet 2: 10.0.4.0/24 (ap-south-1b)



\## Scripts

| Script | Purpose |

|---|---|

| scripts/webserver\_setup.sh | Install and start Apache |

| scripts/userdata.sh | EC2 Launch Template user data |

| scripts/ebs\_mount.sh | Format and mount EBS volume |

| scripts/s3\_backup.sh | Backup files and logs to S3 |

| scripts/stress\_test.sh | CPU stress test for ASG validation |



\## Auto Scaling Configuration

\- Minimum: 2 instances

\- Desired: 2 instances

\- Maximum: 4 instances

\- Scale-out trigger: CPU > 60%



\## Key Outcomes

\- Multi-AZ fault-tolerant architecture

\- Secure private subnets for web servers

\- Automatic scaling validated with stress testing

\- Backup and recovery using EBS snapshots and S3

