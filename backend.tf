terraform {
  backend "s3" {
    profile = "tf_user"
    bucket  = "tf-states-of"
    encrypt = true
    key     = "global/s3/terraform.tfstate"
    region  = "eu-central-1"
  }
}

