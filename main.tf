terraform {
  backend "s3" {
    bucket            = "my_bucket"
    region            = "eu-central-1"
    key               = "my_folder/terraform.tfstate"
    dynamodb_endpoint = "my-dynamodb-terraform-state-locks"
    encrypt           = true
  }
}

provider "aws" {
  profile = "default"
  region = "eu-central-1"
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "my-gitlab-runner"

  ami                    = "ami-0bd99ef9eccfee250"
  instance_type          = "t2.micro"
  key_name               = "my-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-id"]
  subnet_id              = "subnet-id"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
