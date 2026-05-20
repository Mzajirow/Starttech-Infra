output "vpc_id" {
  value = module.networking.vpc_id
}

output "alb_dns" {
  value = module.compute.alb_dns_name
}

output "s3_bucket_name" {
  value = module.storage.frontend_bucket_name
}


output "cloudfront_distribution_id" {
  value = module.storage.cloudfront_distribution_id
}

output "asg_name" {
  value = module.compute.asg_name
}