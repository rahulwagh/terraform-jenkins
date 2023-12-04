module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  eu_availability_zone = var.eu_availability_zone
  cidr_private_subnet  = var.cidr_private_subnet
}

module "security_group" {
  source              = "./security-groups"
  ec2_sg_name         = "SG for EC2 to enable SSH(22), HTTPS(443) and HTTP(80)"
  vpc_id              = module.networking.dev_proj_1_vpc_id
  ec2_jenkins_sg_name = "Allow port 8080 for jenkins"
}

module "jenkins" {
  source                    = "./jenkins"
  ami_id                    = var.ec2_ami_id
  instance_type             = "t2.medium"
  tag_name                  = "Jenkins:Ubuntu Linux EC2"
  public_key                = var.public_key
  subnet_id                 = tolist(module.networking.dev_proj_1_public_subnets)[0]
  sg_for_jenkins            = [module.security_group.sg_ec2_sg_ssh_http_id, module.security_group.sg_ec2_jenkins_port_8080]
  enable_public_ip_address  = true
  user_data_install_jenkins = templatefile("./jenkins-runner-script/jenkins-installer.sh", {})
}

module "lb_target_group" {
  source                   = "./load-balancer-target-group"
  lb_target_group_name     = "jenkins-lb-target-group"
  lb_target_group_port     = 8080
  lb_target_group_protocol = "HTTP"
  vpc_id                   = module.networking.dev_proj_1_vpc_id
  ec2_instance_id          = module.jenkins.jenkins_ec2_instance_ip
}

module "alb" {
  source                    = "./load-balancer"
  lb_name                   = "dev-proj-1-alb"
  is_external               = false
  lb_type                   = "application"
  sg_enable_ssh_https       = module.security_group.sg_ec2_sg_ssh_http_id
  subnet_ids                = tolist(module.networking.dev_proj_1_public_subnets)
  tag_name                  = "dev-proj-1-alb"
  lb_target_group_arn       = module.lb_target_group.dev_proj_1_lb_target_group_arn
  ec2_instance_id           = module.jenkins.jenkins_ec2_instance_ip
  lb_listner_port           = 80
  lb_listner_protocol       = "HTTP"
  lb_listner_default_action = "forward"
  lb_https_listner_port     = 443
  lb_https_listner_protocol = "HTTPS"
  dev_proj_1_acm_arn        = module.aws_ceritification_manager.dev_proj_1_acm_arn
  lb_target_group_attachment_port = 8080
}

module "hosted_zone" {
  source          = "./hosted-zone"
  domain_name     = "jenkins.jhooq.org"
  aws_lb_dns_name = module.alb.aws_lb_dns_name
  aws_lb_zone_id  = module.alb.aws_lb_zone_id
}

module "aws_ceritification_manager" {
  source         = "./certificate-manager"
  domain_name    = "jenkins.jhooq.org"
  hosted_zone_id = module.hosted_zone.hosted_zone_id
}