provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

# Create a custom VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "CustomVPC"
  }
}

# Create a custom subnet within the VPC
resource "aws_subnet" "custom_subnet" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"  # Change as necessary

  tags = {
    Name = "CustomSubnet"
  }
}

# Create a security group for the EC2 instance
resource "aws_security_group" "instance_sg" {
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 22   # Allow SSH access
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to restrict access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "InstanceSG"
  }
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe01e"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.custom_subnet.id
  security_groups = [aws_security_group.instance_sg.name]

  tags = {
    Name = "ExampleInstance"
  }
}

# Then run the command 
# terraform init
# Then
# terraform plan
# Finally
#terraform apply
