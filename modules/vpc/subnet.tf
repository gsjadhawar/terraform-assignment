resource "aws_subnet" "pub" {
  count                   = "${length(var.pub_subnet)}"
  vpc_id                  = "${aws_vpc.custom.id}"
  cidr_block              = "${var.pub_subnet[count.index]}"
  availability_zone       = "${var.pub_azs[count.index]}"
}


resource "aws_subnet" "pvt" {
  count                   = "${length(var.pvt_subnet)}"
  vpc_id                  = "${aws_vpc.custom.id}"
  cidr_block              = "${var.pvt_subnet[count.index]}"
  availability_zone       = "${var.pvt_azs[count.index]}"
}


output "pvt-subnet" {
 value = "${aws_subnet.pvt.id}"
}

output "pub-subnet" {
 value = "${aws_subnet.pub.id}"
}

