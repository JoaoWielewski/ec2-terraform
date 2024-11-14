output "instance_id" {
  description = "EC2's Id"
  value       = aws_instance.meu_ec2.id
}

output "instance_public_ip" {
  description = "EC2's IP Address"
  value       = aws_instance.meu_ec2.public_ip
}

output "instance_public_dns" {
  description = "EC2's public DNS"
  value       = aws_instance.meu_ec2.public_dns
}

output "security_group_id" {
  description = "SG's ID"
  value       = aws_security_group.my_sg.id
}