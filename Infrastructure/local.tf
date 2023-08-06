locals {
  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
  }

  buckets = {
    "my-alb-logs" = {
      versioning_enabled = true
      logging            = false
      grant              = false
      cors_rule          = true
    }
    # "test_bucket" = {
    #   versioning_enabled = true
    #   logging            = false
    #   grant              = false
    # }
  }
}