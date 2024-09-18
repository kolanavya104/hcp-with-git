variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
  default     = "vpc-ee4e8493"
}

variable "subnet_id" {
  description = "The ID of the existing subnet"
  type        = string
  default     = "subnet-98c973c7"
}

variable "security_group_id" {
  description = "The ID of the existing security group"
  type        = string
  default     = "sg-0bbc5e6ba111a1bbf"
}

variable "availability_zone" {
  description = "The availability zone of the existing subnet"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0182f373e66f89c85"
}
