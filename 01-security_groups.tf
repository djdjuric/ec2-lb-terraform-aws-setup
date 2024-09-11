resource "aws_security_group" "instances_app1_security_group" {

  name = "instances_app1_security_group"
  vpc_id = var.vpc_id
  tags = {

  } 
}

resource "aws_security_group_rule" "rule-1" {
type = "ingress"
from_port = 0
to_port = 64
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.instances_app1_security_group.id
}

resource "aws_security_group_rule" "rule-2" {
type = "ingress"
from_port = 0
to_port = 64
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.instances_app1_security_group.id
}

resource "aws_security_group_rule" "rule-3" {
type = "ingress"
from_port = 0
to_port = 64
protocol = "-1"
source_security_group_id = aws_security_group.instances_app1_security_group.id
security_group_id = aws_security_group.instances_app1_security_group.id
}


resource "aws_security_group_rule" "outbound_djdj" {
  type = "egress"
  from_port = 0
  to_port = 256
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instances_app1_security_group.id

}
