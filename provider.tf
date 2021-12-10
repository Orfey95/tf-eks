terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.13"
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "tf_user"
  region                  = "eu-central-1"
}
