terraform {

  backend "s3" {
    bucket         = var.bucket_name
    dynamodb_table = var.dynamodb_table
    key            = "vpc/terraform.tfstate"
    region         = var.region
    encrypt        = true
  }
}
