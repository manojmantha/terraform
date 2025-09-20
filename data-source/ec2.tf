resource "aws_instance" "expense" {
    ami = data.aws_ami.join_devops.id
    vpc_security_group_ids = [aws_security_group.allow_data_source.id]
    instance_type = "t3.micro"

    tags = {
        Name    = "terraform-demo"
        Purpose = "terraform-practice"
    }
}

resource "aws_security_group" "allow_data_source" {
    name = "allow_data_source"
    description = "This traffic rules for count based loop only"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "allow_data_source"
    }
}