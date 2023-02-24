module "dev" {
    source = "../Infra"

    imagem = "ami-0735c191cf914754d"
    tipo_instancia = "t2.micro"
    nome_instancia = "Instancias IaC"
    min_size = 3
    max_size = 5
}

output "DNS_alb" {
  value = module.dev.DNS
}