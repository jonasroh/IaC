resource "aws_security_group" "sg_instance" {
  name        = "sg_instance"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "sg_instance_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance.id
}

resource "aws_security_group_rule" "sg_instance_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # libera para qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance.id
}