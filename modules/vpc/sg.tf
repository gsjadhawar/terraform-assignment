resource "aws_security_group" "main" {
 name = "${var.sg_name}"
 vpc_id = "${aws_vpc.custom.id}"
 ingress {
   from_port = 90
   to_port = 90
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   description = "Port used for Java App"
}

 ingress {
   from_port = 8080 
   to_port = 8080
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   description = "Jenkins"
}

 ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   description = "SSH"
}


 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
  Application = "${var.sg_name}"
  Created_by_terraform = "${var.test}"
  }
}

output "main-sg-id" {
  value = "${aws_security_group.main.id}"
}

