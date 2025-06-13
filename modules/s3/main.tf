resource "aws_s3_bucket" "state_env" {
  force_destroy = true
  bucket        = var.bucket_name
}



