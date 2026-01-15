terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
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
  s3_use_path_style        = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

# --- NE PAS OUBLIER CE BLOC CI-DESSOUS ---
resource "aws_s3_bucket" "test_scalyz" {
  bucket = var.nom_du_bucket
}

# --- TON NOUVEAU BLOC ---
resource "aws_s3_object" "mon_premier_fichier" {
  bucket  = aws_s3_bucket.test_scalyz.id
  key     = "bienvenue.txt"
  content = "Félicitations Hamadi, tout est réparé et automatisé !"
}