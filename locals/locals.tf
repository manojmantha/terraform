locals {
    ami_id = data.aws_ami.join_devops.id
    instance_type = "t3.micro"
    name = "${var.project}-${var.component}-${var.environment}"
}