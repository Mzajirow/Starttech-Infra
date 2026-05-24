# StartTech Infrastructure

Terraform-based AWS infrastructure for:
- React frontend (S3 + CloudFront)
- Golang backend (EC2 + ALB + ASG)
- Redis (ElastiCache)
- Monitoring (CloudWatch)

---

## 🚀 Architecture Overview

### Backend Infrastructure

```text
Internet
   ↓
Application Load Balancer (ALB)
   ↓
Auto Scaling Group (EC2 Instances)
   ↓
Dockerized Golang Application
   ↓
MongoDB Atlas
```

### Frontend Infrastructure

```text
Users
   ↓
CloudFront CDN
   ↓
Amazon S3
   ↓
React/Vite Frontend
```


A bootstrap Terraform layer is used to provision the S3 backend and DynamoDB state locking before deploying the main infrastructure stack.


## 🔐 GitHub Configuration

### Repository Secrets

| Secret | Description |
|---|---|
| AWS_ACCESS_KEY_ID | AWS access key |
| AWS_SECRET_ACCESS_KEY | AWS secret key |
| MONGO_URI | MongoDB Atlas connection string |

### Repository Variables

| Variable | Description |
|---|---|
| AWS_REGION | AWS deployment region |
| PROJECT_NAME | Infrastructure project name |
| ECR_REPOSITORY | ECR repository name |
| S3_BUCKET_NAME | Frontend S3 bucket |
| CLOUDFRONT_DISTRIBUTION_ID | CloudFront distribution ID |

---

## 🐳 Backend Deployment

The backend Golang application is containerized with Docker and deployed on EC2 instances.

The EC2 launch template:
- installs Docker
- pulls the backend image from ECR
- runs the container on port `8080`

Health checks are configured on:

```text
/ping
```

---

## 🌐 Frontend Deployment

Frontend assets are:
1. Built using Vite
2. Uploaded to S3
3. Served globally through CloudFront

---

## 📊 Monitoring

CloudWatch is used for:
- EC2 monitoring
- ALB monitoring
- Auto Scaling metrics
- Log analysis
- Alerting

Monitoring configurations are stored in:

```text
monitoring/
```

---

## 📦 Terraform Commands

### Initialize Terraform

```bash
cd terraform
terraform init
terraform validate
terraform plan
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## 📌 Outputs

Terraform outputs include:
- ALB DNS name
- Auto Scaling Group name
- CloudFront distribution ID
- S3 bucket name
- VPC ID

---

## 🧪 Troubleshooting

### Unhealthy Target Groups
- Verify Docker container is running
- Confirm application listens on port `8080`
- Check security group rules
- Validate `/ping` health check endpoint

### ALB Reachability Issues
Ensure:
- ALB uses public subnets
- Route tables contain:

```text
0.0.0.0/0 → Internet Gateway
```

---

## 🔒 Security

- Sensitive values are stored in GitHub Secrets
- Security groups restrict unnecessary inbound access
- MongoDB Atlas credentials are managed securely
- IAM follows least privilege principles

---

## 👤 Author

Built as part of the StartTech Cloud/DevOps infrastructure assessment using Terraform, AWS, Docker, and GitHub Actions.