# Provider configuration
provider "aws" {
  region = "us-east-1"
}

# Create a new VPC
resource "aws_vpc" "new_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true   # Ensure DNS support is enabled
  enable_dns_hostnames = true   # Ensure DNS hostnames are enabled

  tags = {
    Name = "MyVPC"
  }
}

# Create a subnet in the new VPC
resource "aws_subnet" "new_subnet" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "MySubnet"
  }
}


# Create an internet gateway for the VPC
resource "aws_internet_gateway" "new_igw" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "MyIntGateway"
  }
}

# Create a route table for the VPC
resource "aws_route_table" "new_route_table" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_igw.id
  }

  tags = {
    Name = "MyRoutTable"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "new_route_table_association" {
  subnet_id      = aws_subnet.new_subnet.id
  route_table_id = aws_route_table.new_route_table.id
}

# Create a new security group
resource "aws_security_group" "new_sg" {
  vpc_id = aws_vpc.new_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

# Create a new EC2 instance
resource "aws_instance" "new_instance" {
  ami                    = "ami-0e86e20dae9224db8" # Example AMI ID, use a valid one from your region
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.new_subnet.id
  vpc_security_group_ids = [aws_security_group.new_sg.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name = "MyEC2instance"
  }
}
