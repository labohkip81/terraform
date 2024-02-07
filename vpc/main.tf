provider "aws" {

    region = "eu-west-2"
  
}

resource "aws_vpc" "demo-vpc" {

    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "demo-vpc"
    }
  
}

resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "private-subnet-1"
    }
  
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-2b"
    tags = {
        Name = "private-subnet-2"
    }
  
}

resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "public-subnet-1"
    }
  
}


resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      Name = "public-subnet-2"
    }
  
}

resource "aws_internet_gateway" "my-internet-gateway" {
    vpc_id = aws_vpc.demo-vpc.id
    tags = {
      Name = "demo-vpc-IGW"
    }
  
}


resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.demo-vpc.id
    tags = {
      Name = "public-route-table"
    }
  
}


resource "aws_route" "public-route" {
    route_table_id = aws_route_table.public-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
}


resource "aws_route_table_association" "public-subnet-1-association" {
    subnet_id = aws_subnet.private-subnet-1.id
    route_table_id = aws_route_table.public-route-table.id
  
}

resource "aws_route_table_association" "public-subnet-2-association" {
    subnet_id = aws_subnet.public-subnet-2.id
    route_table_id = aws_route_table.public-route-table.id
  
}