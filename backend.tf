
terraform {
  backend "s3" {
    bucket = "cllbucket1033"
    dynamodb_table = "ECS-dmm"
    key    = "global/terraform.tfstate"
    encrypt = true
    region = "us-west-1"

  }
}
