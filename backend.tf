/*backend "s3" {
    bucket =
    key    =
    region =
    dynamodb_table =
    encrypt =
}




resource "aws_s3_bucket" "elc-bucket" {
  bucket = "elc-test-bucket"
versioning {
    enabled = true
}
  tags = {
    Name        = " elc-bucket-name"
    Environment = "Dev"
  }

}


resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "elc-dynamodb"
  billing_mode   = "PROVISIONED"
  hash_key       = "elcUserId"
  
  attribute {
    name = "elc-UserId"
    type = "S"
  }
}*/


