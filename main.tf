module "vpc" {
  source = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs= ["10.0.101.0/24", "10.0.102.0/24"]
  azs                 = ["us-east-1a", "us-east-1b"]
}
output "vpc_id" {
  value = module.vpc.vpc_id
}

module "alb" {
    source = "./modules/alb"
  
    vpc_id            = module.vpc.vpc_id
    public_subnet_ids  = module.vpc.public_subnet_ids
    key_name          = "ec2keys" 
    instance_type=lookup(var.instance_type, terraform.workspace, "t2.micro")
  }

module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  db_identifier =  lookup(var.db_identifier,terraform.workspace, "rds_db")
  db_name       = lookup(var.db_name, terraform.workspace, "rds_db")
  db_username   = lookup(var.db_username, terraform.workspace, "rds_db")
  db_password   = lookup(var.db_password, terraform.workspace, "rds_db")
}


# module "s3" {
#   source      = "./modules/s3"
#   bucket_name = "state-for-diff-env"
# }
# resource "aws_dynamodb_table" "terraform_lock" {
#   name="terraform-lock"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }