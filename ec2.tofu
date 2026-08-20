module "bastion" {
  source = "./modules/ec2"

  name                  = "bastion"
  instance_type         = var.instance_type
  key_pair_name         = var.key_pair_name
  ami_id                = data.aws_ami.ubuntu.id
  security_group_config = local.bastion_security_group_config
  subnet_id             = module.vpc.subnet_public_ids["public"][0]
  vpc_id                = module.vpc.vpc_id
  common_tags           = local.common_tags
  enabled_eip           = true
}