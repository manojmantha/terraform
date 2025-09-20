resource "aws_instance" "expense" {
    ami = local.ami_id # Expressions are stroed in local we can't store in variable
    vpc_security_group_ids = [aws_security_group.allow_data_source.id]
    instance_type = local.instance_type # Using local variables we can't override this helps to restrict the instance type. 

    tags = {
        Name = local.name # Variable inside variable we cannot use in variables so we are using the local here.
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