# Output vrednosti za Free Tier demo

output "vpc_id" {
  description = "ID VPC-a"
  value       = aws_vpc.main.id
}

output "instance_id" {
  description = "ID EC2 instance-a"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Javna IP adresa instance-a"
  value       = aws_eip.web.public_ip
}

output "instance_private_ip" {
  description = "Privatna IP adresa instance-a"
  value       = aws_instance.web.private_ip
}

output "website_url" {
  description = "URL web sajta"
  value       = "http://${aws_eip.web.public_ip}"
}

output "ssh_command" {
  description = "SSH komanda za pristup serveru"
  value       = "ssh -i ~/.ssh/demo-free-key ec2-user@${aws_eip.web.public_ip}"
}

output "security_group_id" {
  description = "ID Security Group-a"
  value       = aws_security_group.web.id
}

# Free Tier informacije
output "free_tier_usage" {
  description = "Informacije o Free Tier korišćenju"
  value = {
    instance_type    = aws_instance.web.instance_type
    volume_size     = "${aws_instance.web.root_block_device[0].volume_size}GB"
    volume_type     = aws_instance.web.root_block_device[0].volume_type
    estimated_cost  = "$0.00 (Free Tier)"
    monthly_hours   = "750 hours available"
  }
}
