terraform {
  backend "s3" {
    bucket         = "your-existing-bucket-name"        
    key            = "control-tower/terraform.tfstate"   
    region         = "ap-south-1"                                        
  }
}
