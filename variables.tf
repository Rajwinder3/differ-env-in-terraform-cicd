
variable "db_name" {
 description = "db name" 
  type = map(string)
  default = {
    "dev" = "dev_rds",
    "stage" ="stage_rds",
    "prod"= "prod_rds"
  }
}

variable "db_identifier" {
  description = "db identifier"
  type = map(string)
  default = {
    "dev" = "dev-rds-work",
    "stage" ="stage-rds-work",
    "prod"= "prod-rds-work"
  }
}

variable "db_username" {
 description = "username "
  type = map(string)
  default = {
    "dev" = "dev_user",
    "stage" ="stage_user",
    "prod"= "prod_user"
  }
}
variable "db_password" {
 description = "password"  
  type = map(string)
  default = {
    "dev" = "dev_pass",
    "stage" ="stage_pass",
    "prod"= "prod_pass"
  }
}

variable "instance_type" {
 description = "instance type"  
  type = map(string)
  default = {
    "dev" = "t2.micro",
    "stage" ="t2.medium",
    "prod"= "t2.large"
  }
}

variable "environment" {
  description = "The environment to deploy to"
  type        = string
}

