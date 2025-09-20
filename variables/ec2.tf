resource "aws_instance" "expense" {
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.allow-var.id]
    instance_type = var.instance_type

    tags = var.ec2_tags
}

resource "aws_security_group" "allow-var" {

    name = "allow-var"
    description = "This is firewall for variables practice"

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks = var.cidr_blocks
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = var.sgs_tags
    
}

# Variables Perference 
# 1. command line --> -var "<var-name>=<var-value>"
# 2. tfvars --> <var_name>="<var_value>"
# 3. env var --> export TF_VAR_<var_name>="<var_value>"
# 4. default values 
# 5. user prompt 