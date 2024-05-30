# module "ec2-1a" {
#   source            = "./modules/ec2"
#   tags              = local.tags
#   availability_zone = module.subnet_1a.availability_zone
#   ami               = "ami-0a6db7d09c3037d6c"
#   #security_group = ""
#   subnet_id     = module.subnet_1a.subnet_id
#   instance_type = "t2.micro"
#   depends_on = [
#     module.vpc_main,
#     module.subnet_1a
#   ]
# }

# module "ec2-1b" {
#   source            = "./modules/ec2"
#   tags              = local.tags
#   availability_zone = module.subnet_1b.availability_zone
#   ami               = "ami-0a6db7d09c3037d6c"
#   #security_group = ""
#   subnet_id     = module.subnet_1b.subnet_id
#   instance_type = "t2.micro"
#   depends_on = [
#     module.vpc_main,
#     module.subnet_1b
#   ]
# }

#  resource "aws_instance"  module "ec2-1c" {
#   source            = "./modules/ec2"
#   tags              = local.tags
#   availability_zone = module.subnet_1c.availability_zone
#   ami               = "ami-0a6db7d09c3037d6c"
#   #security_group = ""
#   subnet_id     = module.subnet_1b.subnet_id
#   instance_type = "t2.micro"
#   depends_on = [
#     module.vpc_main,
#     module.subnet_1b
#   ]
# }