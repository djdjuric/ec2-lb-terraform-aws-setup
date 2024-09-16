resource "aws_lb" "app1_lb" {

name = "app1-test-lb"
internal = false
load_balancer_type = "application"
security_groups = [aws_security_group.instances_app1_security_group.id]
subnets = ["subnet-" , "subnet-"]

  
}

resource "aws_lb_listener" "app1_lb_listner-443" {
  load_balancer_arn = aws_lb.app1_lb.arn
  protocol = "HTTP"
  port = 443
  
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app1-instances.arn
  }
 
}

resource "aws_lb_listener" "app1_lb_listner-80" {
  load_balancer_arn = aws_lb.app1_lb.arn
  protocol = "HTTP"
  port = 80
  
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app1-instances.arn
  }
 
}


resource "aws_lb_target_group" "app1-instances" {
    name = "app1-instances"
    port = 80 
    protocol = "HTTP"
    vpc_id = var.vpc_id
    health_check {
      enabled = true
      path = "/index.html"
      matcher = "200-299" 
      healthy_threshold = 2
      unhealthy_threshold = 2
      interval = 15
      port = 80 
      timeout = 10
    }

}

resource "aws_lb_target_group_attachment" "lb_instance_attachments" {
  count             = length(aws_instance.t4gnano_instance) 
  target_id         = aws_instance.t4gnano_instance[count.index].id
  target_group_arn  = aws_lb_target_group.app1-instances.arn
}
