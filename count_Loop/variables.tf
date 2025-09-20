variable "instances" {
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z00951673I2OYCZYMUOPO"
}

variable "domain_name" {
    default = "manojmantha.online"
}

variable "common_tags" {
    type = map 
    default = {
        Project = "expense"
        Environment = "dev"
    }
}

