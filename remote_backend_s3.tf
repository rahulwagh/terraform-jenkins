terraform {
  backend "s3" {
    bucket = "terraform-jenkinsapi-project-s3"
    key    = "restapi-jenkins/terraform.tfstate"
    region = "eu-west-1"
  }
}