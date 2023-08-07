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
      route53            = false
      domain_name        = "example.com"
    }
    # "test_bucket" = {
    #   versioning_enabled = true
    #   logging            = false
    #   grant              = false
    #   route53            = true
    #   domain_name        = "example1.com"
    # }
  }
}