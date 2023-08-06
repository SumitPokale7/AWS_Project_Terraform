
variable "region" {
  type    = string
  default = "ap-south-1"
}

#network
variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(any)
}

variable "public_subnet_cidrs" {
  type = list(any)
}

variable "private_subnets_cidrs" {
  type = list(any)
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "enable_dns_support" {
  type    = bool
  default = false
}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}

variable "single_nat_gateway" {
  type    = bool
  default = false
}