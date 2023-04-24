terraform {
  backend "s3" {
    bucket = "lab-terraform-state-bucket-new"
    region = "us-east-1"
    key    = "backend/terraform.tfstate"
  }
}