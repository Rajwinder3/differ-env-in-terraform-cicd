output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.alb.dns_name
}

output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.app_server[*].id
}

output "ec2_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.app_server[*].public_ip
}
