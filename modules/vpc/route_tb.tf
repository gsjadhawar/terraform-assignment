#route table with route to go public subnet traffic on internet gateway
resource "aws_route_table" "pub" {
  vpc_id = "${aws_vpc.custom.id}"

   route {
    cidr_block = "10.20.10.0/24"
    gateway_id = "${aws_internet_gateway.igw.id}"
   }

  tags = {
    Created_by_Terraform = "{$var.test}"
    Name = "rt-pub"
    }
}

#pub subnet Association  with rt table 
resource "aws_route_table_association" "pub_as" {
  subnet_id      = "${aws_subnet.pub.0.id}"
  route_table_id = "${aws_route_table.pub.id}"
}


#route table with route to go private subnet traffic on nat gw
resource "aws_route_table" "pvt" {
  vpc_id = "${aws_vpc.custom.id}"

   route {
    cidr_block = "10.20.20.0/24"
    gateway_id = "${aws_internet_gateway.igw.id}"
   }

  tags = {
    Created_by_Terraform = "{$var.test}"
    Name = "rt-pvt"
    }
}

#pvt subnet Association  with rt table
resource "aws_route_table_association" "pvt_as" {
  subnet_id      = "${aws_subnet.pvt.0.id}"
  route_table_id = "${aws_route_table.pvt.id}"
}


