module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.1.0"

  name = "awsproject-${terraform.workspace}"

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnets
  security_groups = [var.default_security_group_id]

  # Map containing access logging configuration for load balancer.	
  # access_logs = {
  #   bucket = "my-alb-logs"
  # }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      # targets = {
      #   my_target = {
      #     target_id = "i-0123456789abcdefg"
      #     port      = 80
      #   }
      # }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
  tags = var.tags
}
