provider "aws" {
  region = var.region
}

module "networking" {
  source = "../../modules/networking"

  project              = var.project
  environment          = var.environment
  region               = var.region
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}
module "webserver" {
  source = "../../modules/webserver"

  project              = var.project
  environment          = var.environment
  vpc_security_group_ids = [module.networking.default_sg_id]
  public_subnet_id = module.networking.public_subnets_id[0]
}
