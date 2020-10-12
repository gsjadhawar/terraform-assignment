data "aws_ami" "redhat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-8.2.0_HVM-20200423-x86_64-0-Hourly2-GP2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"]
}

resource "aws_instance" "server" {
  ami           = "${data.aws_ami.redhat.id}"
  instance_type = "t3.micro"
  subnet_id = "${var.subnet}" 
  security_groups = ["${var.sg}"]  
  user_data = "${file("${path.module}/${var.userdatafile}")}"
  tags = {
    Name = "${var.ec2_name}"
    Created_by_terraform = "${var.test}"
  }
}
