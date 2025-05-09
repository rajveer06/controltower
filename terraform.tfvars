region = "us-east-1"
product_id               = "prod-xxxxxxxx"
provisioning_artifact_id = "pa-xxxxxxxx"

org_structure = {
  "Non-Prod" = {
    Dev = {
      email      = "dev@example.com"
      first_name = "Dev"
      last_name  = "Admin"
    }
    Stage = {
      email      = "stage@example.com"
      first_name = "Stage"
      last_name  = "Admin"
    }
    Test = {
      email      = "test@example.com"
      first_name = "Test"
      last_name  = "Admin"
    }
  }
  "Prod" = {
    ProdUS = {
      email      = "produs@example.com"
      first_name = "US"
      last_name  = "Admin"
    }
    ProdIndia = {
      email      = "prodindia@example.com"
      first_name = "India"
      last_name  = "Admin"
    }
  }
}
