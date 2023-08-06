module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.5.0"
  
  # Autoscaling group
  name = "awsproject-${terraform.workspace}"

  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  count                     = length(var.public_subnets)
  vpc_zone_identifier       = [var.public_subnets[count.index]]

  # Launch template
  launch_template_name        = "awsproject-${terraform.workspace}"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = "ami-0f5ee92e2d63afc18"
  instance_type     = "t2.micro"
  ebs_optimized     = true
  enable_monitoring = true

  # IAM role & instance profile
  create_iam_instance_profile = true
  iam_role_name               = "awsproject-${terraform.workspace}"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role example"

  iam_role_tags = {
    CustomIamRole = "Yes"
  }

  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = ["${var.default_security_group_id}"]
    }
  ]
 
  placement = {
    availability_zone = "${var.azs[count.index]}"
  }
  tags = var.tags
}

# resource "aws_security_group" "allow_ssh_traffic" {
#   name   = "bastion-sg-${terraform.workspace}"
#   vpc_id = var.vpc_id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = merge(
#     {
#       Name = "bastion-sg-${terraform.workspace}"
#     },
#     var.tags
#   )
# }