module "network" {
  source                = "../modules/network"
  vpc_cidr              = var.vpc_cidr
  azs                   = var.azs
  private_subnets_cidrs = var.private_subnets_cidrs
  public_subnet_cidrs   = var.public_subnet_cidrs
  enable_dns_hostnames  = var.enable_dns_hostnames
  enable_dns_support    = var.enable_dns_support
  enable_nat_gateway    = var.enable_nat_gateway
  single_nat_gateway    = var.single_nat_gateway
  tags                  = local.tags
}

module "ec2" {
  source = "../modules/ec2"
  azs                       = var.azs
  vpc_id                    = module.network.vpc_id
  public_subnets            = module.network.public_subnets
  count                     = length(module.network.private_subnets)
  private_subnets           = module.network.private_subnets[count.index]
  default_security_group_id = module.network.default_security_group_id
  tags                      = local.tags
  depends_on = [
    module.network
    # module.compute
  ]
}

module "alb" {
  source = "../modules/alb"
  vpc_id                    = module.network.vpc_id
  public_subnets            = module.network.public_subnets
  default_security_group_id = module.network.default_security_group_id
  tags                      = local.tags
  depends_on = [
    module.network
    # module.compute
  ]
}

module "s3" {
  source  = "../modules/s3"
  tags    = local.tags
  buckets = local.buckets
  depends_on = [
    module.network
  ]
}