resource "aws_vpc" "custom" {
  cidr_block = "${var.vpc_cidr_block}"
  tags = {
    Name = "${var.vpc_name}"
	Created_By_Terraform = "${var.test}" 
  }
}

resource "aws_internet_gateway" "igw" {
 vpc_id = "${aws_vpc.custom.id}"
 tags {
  Name = "${var.vpc_name}"
  Created_by_Terraform = "True"
 }
}

output "vpc_name" {
 value = "${aws_vpc.custom.id}"
}

output "igw_name" {
 value = "${aws_internet_gateway.igw.id}"
}

