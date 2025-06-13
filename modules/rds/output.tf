output "rds_endpoint" {
  value       = aws_db_instance.db_instance.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.db_instance.id
}

output "rds_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.name
}

output "security_group_id" {
  value = aws_security_group.rds_sg.id
}