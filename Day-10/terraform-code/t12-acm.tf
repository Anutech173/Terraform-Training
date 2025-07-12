data "aws_route53_zone" "dns_zone" {
  name         = "balatraining.in"
  private_zone = false
}

module "acm" {
  source      = "terraform-aws-modules/acm/aws"
  version     = "6.0.0"
  domain_name = data.aws_route53_zone.dns_zone.name
  zone_id     = data.aws_route53_zone.dns_zone.id
  subject_alternative_names = [
    "balatraining.in",
    "*.balatraining.in"
  ]
  validation_method = "DNS"
  tags              = local.common_tags
}