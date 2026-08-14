resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.algadelivery.id

  ingress {
    description = "Allow SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.my_public_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.internet_cidr_block]
  }
  tags = merge(local.common_tags, {
    Name = "bastion_sg"
  })
}

resource "aws_security_group" "security_group_private" {
  name        = "security_group_private"
  description = "Allow TLS inbound traffic from the bastion security group and all outbound traffic"
  vpc_id      = aws_vpc.algadelivery.id

  ingress {
    description = "Allow TLS inbound traffic from the bastion security group"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.algadelivery.cidr_block]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.internet_cidr_block]
  }

  tags = merge(local.common_tags, {
    Name = "private_sg"
  })
}