variable "instances" {
    type = map 
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
    type = string
    default = "Z00951673I2OYCZYMUOPO"
}

variable "domain_name" {
    type = string 
    default = "manojmantha.online"
}