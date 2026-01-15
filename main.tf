terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" 
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  
  # On a changé "use" par "force" ici :
  s3_force_path_style         = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "test_scalyz" {
  bucket = var.nom_du_bucket     # <--- On dit à Terraform : "Va chercher la valeur dans variables.tf"
}