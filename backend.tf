terraform {
  backend "s3" {
    bucket = "state-for-diff-env"
    region = "us-east-1"
    key = "statefiles/terraform.tfstate"
    use_lockfile  = true
    encrypt        = true
  }
}
