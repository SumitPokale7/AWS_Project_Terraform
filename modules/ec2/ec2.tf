module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name                   = "awsproject-${terraform.workspace}"
  vpc_security_group_ids = [var.default_security_group_id]
  ami                    = "ami-0f5ee92e2d63afc18"
  subnet_id              = var.private_subnets
  instance_type          = var.instance_type
  monitoring             = true
  tags = merge(
    {
      Name = "awsproject-${terraform.workspace}"
    },
    var.tags
  )
}

# resource "aws_instance" "web" {
  
#   ami           = "ami-0f5ee92e2d63afc18"
#   instance_type = "t2.micro"

#   tags = merge(
#     {
#       Name = "awsproject-${terraform.workspace}"
#     },
#     var.tags
#   )
# }