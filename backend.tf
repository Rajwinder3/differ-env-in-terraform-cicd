terraform {
  backend "s3" {
    bucket = "state-for-diff-env"
    region = "us-east-1"
    key = "statefiles/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
