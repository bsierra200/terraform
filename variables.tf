variable "region" {
  default     = "us-west-1"
  description = "Region a utilizar en AWS"
}

variable "vpc_cidr" {
  
  default     = "VPC cidr"
  description = "10.0.0.0/16"
}

variable "subnet_cidr" {
  
  default     = "Subnet"
  description = "10.0.10.0/24"
}






variable "ami_id" {
  type        = string
  default     = ""
  description = "Ami EC2 LINUx"
}

export PATH="$PATH:/home/bsierra/DevOps/infra-aws"
