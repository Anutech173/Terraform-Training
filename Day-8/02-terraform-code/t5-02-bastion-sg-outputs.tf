output "bastion_security_group_id" {
  description = "The ID of the security group"
  value       = module.bastion_security_group.security_group_id
}