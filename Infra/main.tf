resource "aws_launch_configuration" "configuracao-de-lancamento" {
  image_id        = "ami-0735c191cf914754d"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg_instance.id]
  key_name = aws_key_pair.meu-par-de-chaves.key_name

}


resource "aws_autoscaling_group" "meu-grupo-de-autoscaling" {
  launch_configuration = aws_launch_configuration.configuracao-de-lancamento.id
  vpc_zone_identifier  = module.vpc.public_subnets
  min_size             = 1
  max_size             = 3

  tag {
    key                 = "Name"
    value               = "Minha Instância EC2"
    propagate_at_launch = true
  }
}
