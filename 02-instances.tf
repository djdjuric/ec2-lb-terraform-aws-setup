data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ec2_ami]

  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]

}

resource "aws_instance" "t4gnano_instance" {

  count = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t4g.nano"

  user_data = templatefile("./scripts/init.sh.tpl", {})

  key_name               = aws_key_pair.kp_djole.id
  depends_on             = [aws_security_group.instances_app1_security_group]
  vpc_security_group_ids = [aws_security_group.instances_app1_security_group.id]
  tags = {
    Name = "t4gnano"
  }

}

resource "aws_key_pair" "kp_djole" {
  key_name   = "djole-key"
  public_key = var.pub_key_djdjuric
}

