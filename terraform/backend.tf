terraform {
  backend "s3" {
    bucket         = "terraform-backend-teamcity1"
    key            = "terraform/terraform-poc5.tfstate"
    region         = "us-west-2"
    dynamodb_table = "DT-terraform-backend-teamcity-poc5"
    encrypt        = true
  }
}
