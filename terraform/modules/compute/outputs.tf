output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "asg_name" {
  value = aws_autoscaling_group.asg.name
}