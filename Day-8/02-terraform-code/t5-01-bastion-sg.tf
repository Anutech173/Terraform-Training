module "bastion_security_group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.3.0"
  name        = "bastion-sg"
  description = "security group created for bastion which will allow port 22 from everywhere"
  vpc_id      = module.vpc.vpc_id

  # Ingress rules
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  tags                = local.common_tags

  # egress rules
  egress_rules = ["all-all"]

}