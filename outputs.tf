output "my_ec2_ip" {
  value = aws_instance.name.public_ip
}
