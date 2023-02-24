# IaC

Nesse primeiro momento foi feito o provisionamento de um autoscaling group na AWS.


# atualizar apache
https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-apache-on-ubuntu-18-04-pt

host dinamicos
Passo 2: Crie um grupo de hosts para suas instâncias EC2

Em seguida, crie um grupo de hosts em seu arquivo de inventário do Ansible para representar suas instâncias EC2. Por exemplo, se você quiser configurar um servidor Apache em uma instância EC2 com o ID i-0123456789abcdef0, você pode adicionar o seguinte ao seu arquivo de inventário:

css

[ec2_instances]
i-0123456789abcdef0