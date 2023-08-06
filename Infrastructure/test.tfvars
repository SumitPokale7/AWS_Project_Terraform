region = "ap-south-1"
#network
vpc_cidr              = "10.0.0.0/16"
azs                   = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidrs   = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
enable_dns_hostnames  = true
enable_dns_support    = false
enable_nat_gateway    = true
single_nat_gateway    = false