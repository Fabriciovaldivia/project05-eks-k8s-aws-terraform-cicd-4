terraform {
  backend "s3" {
    bucket         = "project05-terraform-state-eks"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "project05-terraform-lock-eks"
    encrypt        = true
  }
}
