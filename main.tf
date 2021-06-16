provider "aws" {
  region     = "us-west-1" 
  access_key = "AKIAVT5CYJDBIVCMG66E" 
  secret_key = "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" 
}

#Creando VPC en AWS
resource "aws_vpc" "main1" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "prueba-blacktrust"
  }
}

#Creando subnet en AWS

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main1.id}"
  cidr_block = "10.0.10.0/24"
  tags = {
    Name = "subnet1"
  }
}

#Creando un gateway en AWS

resource "aws_internet_gateway" "gwblacktrust" {
  vpc_id = "${aws_vpc.main1.id}"

  tags = {
    Name = "Gateway main"
  }
}

#Creando un routeTable
resource "aws_route_table" "routetable" {
    vpc_id = "${aws_vpc.main1.id}"
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gwblacktrust.id}"
  }
  
}

#Se asocia la subnet y el routetable
resource "aws_route_table_association" "associate" {
  subnet_id      = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.routetable.id}"
}
