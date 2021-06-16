resource "aws_instance" "blacktrust-prueba" {
  ami           = "ami-0d382e80be7ffdae5"
  instance_type = "t2.medium"
  count         =  1
  subnet_id     = "${aws_subnet.subnet1.id}"
  associate_public_ip_address = true 
  vpc_security_group_ids  =  [ "${aws_security_group.blacktrust-security1.id}"]
 # key_name                =  "class_key1"
  user_data = "${file("userdata.sh")}"
  key_name                =  "${aws_key_pair.key-class1.id}"


  tags = {
    Name = "Blacktrust-prueba"
    
  }
}
