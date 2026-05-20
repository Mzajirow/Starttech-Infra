# StartTech Infrastructure

Terraform-based AWS infrastructure for:
- React frontend (S3 + CloudFront)
- Golang backend (EC2 + ALB + ASG)
- Redis (ElastiCache)
- Monitoring (CloudWatch)

## Deployment

```bash
cd terraform
terraform init
terraform apply

A bootstrap Terraform layer is used to provision the S3 backend and DynamoDB state locking before deploying the main infrastructure stack.”