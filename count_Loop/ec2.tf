resource "aws_instance" "expense" {
    count = length(var.instances)
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_count.id]
    instance_type = "t3.micro"

    tags = merge(
        var.common_tags,
        {
            Name = var.instances[count.index]
        }
    )
}

resource "aws_security_group" "allow_count" {
    name = "allow_count"
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
      Name = "allow_count"
    }
}