module "vpc_subnet_launch" {
  source = "../modules/vpc/"
  vpc_cidr_block = "172.20.0.0/16"
  vpc_name = "petclinic-vpc"
  test = "True"
  pub_subnet = ["172.20.10.0/24"]
  pvt_subnet = ["172.20.20.0/24"]
  pub_azs = ["us-east-1a"]
  pvt_azs = ["us-east-1b"] 
  sg_name = "petclinic-sg"
}

module "ec2_devtool_launch" {
  source = "../modules/ec2/"
  vpc = "${module.vpc_subnet_launch.vpc_name}"
  subnet = "${module.vpc_subnet_launch.pub-subnet}"
  ec2_name = "devops-jenkins-ansible"
  test = "True"
  sg = "${module.vpc_subnet_launch.main-sg-id}"
  userdatafile = "user_data.sh"
} 

module "ec2_javapp_launch" {
  source = "../modules/ec2/"
  vpc = "${module.vpc_subnet_launch.vpc_name}"
  subnet = "${module.vpc_subnet_launch.pvt-subnet}"
  ec2_name = "java-app-server"
  test = "True"
  sg = "${module.vpc_subnet_launch.main-sg-id}"
  userdatafile = "nothing_user_data.sh"
}

