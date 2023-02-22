resource "aws_key_pair" "meu-par-de-chaves" {
  key_name   = "meu-par-de-chaves"
  public_key = file("~/.ssh/chave-aws.pub")
}
