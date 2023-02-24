resource "aws_launch_configuration" "configuracao-de-lancamento" {
  image_id        = var.imagem
  instance_type   = var.tipo_instancia
  security_groups = [aws_security_group.sg_instance.id]
  key_name = aws_key_pair.meu-par-de-chaves.key_name

}


resource "aws_autoscaling_group" "meu-grupo-de-autoscaling" {
  launch_configuration = aws_launch_configuration.configuracao-de-lancamento.id
  vpc_zone_identifier  = module.vpc.public_subnets
  min_size             = var.min_size
  max_size             = var.max_size

  tag {
    key                 = "Name"
    value               = var.nome_instancia
    propagate_at_launch = true
  }
}
