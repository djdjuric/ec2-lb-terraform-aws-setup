provider "aws" {
  region                   = var.aws_provider["region"]
  shared_credentials_files = [var.aws_provider["creds_location"]]
  profile                  = var.aws_provider["profile"]
  
}
