# RDS Subnet Group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "db-subnet-group"
  }
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow RDS traffic (customize as needed)"
  vpc_id      = var.vpc_id

  # Only allow access from the app tier (customize in use)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Replace with app subnet CIDR or SG ref
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS Instance with Multi-AZ
resource "aws_db_instance" "db_instance" {
  identifier              = var.db_identifier
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  username                = var.db_username
  password                = var.db_password
  multi_az                = false
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true

  tags = {
    Name = "rds-instance"
  }
}
