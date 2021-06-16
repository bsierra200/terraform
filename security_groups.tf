resource "aws_security_group" "blacktrust-security1" {
  name        = "sgroupblack"
  description = "Permitir ping y ssh"
  vpc_id      = "${aws_vpc.main1.id}"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
   
    from_port        = -1
    to_port          = -1
    protocol         =  "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "blacktrust-security-group_tls"
  }
}
