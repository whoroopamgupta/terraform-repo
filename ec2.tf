# key_pair

resource "aws_key_pair" "deployer" {
  key_name   = "tws-terra-key"
  public_key = file("C:/Users/Admin/Desktop/terraform-practice-aug25/terra-key.pub")
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "tws_security_group" {
  name        = "allow ports"
  description = "this is a security group to allow ports for ec2 instance"
  vpc_id      = aws_default_vpc.default.id

  #   ingress - incoming traffic 
  ingress {
    description = "this is to allow ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allows access from anywhere
  }

  #   egress - outgoing traffic
  egress {
    description = "this is to allow all outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # allows all outgoing traffic
  }
}


resource "aws_instance" "name" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.tws_security_group.name]
  tags = {
    Name = "MyFirstInstanceAug25"
  }
}
