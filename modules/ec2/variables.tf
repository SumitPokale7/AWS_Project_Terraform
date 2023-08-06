variable "azs" {}
variable "vpc_id" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "default_security_group_id" {}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "tags" {
  type = map(string)
  default = {
    Environment = "test"
    Terraform   = true
  }
}
