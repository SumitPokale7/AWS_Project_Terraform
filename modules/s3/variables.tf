variable "buckets" {
  type = map(any)
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "test"
    Terraform   = true
  }
}