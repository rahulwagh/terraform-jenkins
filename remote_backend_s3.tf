terraform {
  backend "s3" {
    bucket = "jatto-projects3statebackend"
    key    = "global/mybucket/terraform.tfstate"
    region = "eu-west-1"
  }
}