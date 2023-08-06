variable "vpc_id" {}
variable "public_subnets" {}
variable "default_security_group_id" {}

variable "tags" {
  type = map(string)
  default = {
    Environment = "test"
    Terraform   = true
  }
}