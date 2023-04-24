terraform {
  backend "s3" {
    bucket = "lab-terraform-state-bucket-management"
    region = "us-east-1"
    key    = "backend/terraform.tfstate"
  }
}
