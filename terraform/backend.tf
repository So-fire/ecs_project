terraform {
  backend "s3" {
    encrypt = true
    bucket  = "safespace-frontend-tfstate-bucket"
    key     = "ecs/practice.tfstate"
    region  = "us-east-1"
    # profile        = "default"
  }
}
