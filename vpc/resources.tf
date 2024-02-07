resource "aws_instance" "private-instance" {
    ami = "ami-0e5f882be1900e43b"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private-subnet-1.id
    tags = {
        Name = "private-instance"
    }
}


resource "aws_instance" "public-instance" {
    ami = "ami-0e5f882be1900e43b"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet-1.id
    tags = {
      Name = "public-instance"
    }
}