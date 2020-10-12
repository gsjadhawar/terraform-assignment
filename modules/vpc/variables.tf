variable "vpc_cidr_block" {
  type = "string"
  description = "vpc cidr"
}

variable "vpc_name" {
	type = "string"
	description = "vpc name or tag for vpc"
}

variable "test" {
	type = "string"
	description = "it cater True or False value"
}

variable "pvt_subnet" {
        type = "list"
}

variable "pub_subnet" {
        type = "list"
}

variable "pub_azs" {
	type = "list"
}

variable "pvt_azs" {
	type = "list"
}

variable "sg_name" {
	type = "string"
}
