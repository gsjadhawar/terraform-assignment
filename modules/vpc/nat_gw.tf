#First we need to allocate public ip as below
resource "aws_eip" "nat" {
 vpc = true
}

resource "aws_nat_gateway" "nat_pub" {
 allocation_id = "${aws_eip.nat.id}"
 subnet_id = "${aws_subnet.pub.0.id}"
 tags = {
   Name = "${var.vpc_name}"
   Created_By_Terraform = "True"
   }
 }

