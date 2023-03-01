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

resource "aws_security_group" "alb" {
  name        = "alb_apache_server"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_tcp_alb" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "saida_tcp_alb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # libera para qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group" "privado" {
  name        = "privado_apache_server"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_apache" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = aws_security_group.alb.id
  security_group_id = aws_security_group.privado.id
}

resource "aws_security_group_rule" "saida_apache" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # libera para qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.privado.id
}