provider "aws" {
  region                   = "eu-west-1" # Replace with your desired AWS region
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform-dev-deployment"
}