resource "aws_instance" "kubernetes-t2g2-backend" {
  count         = 3
  ami           = var.ami
  instance_type = var.tipo_instancia_kubernetes
  subnet_id     = "subnet-02ef0d140a6c2a4a8"
  key_name      = "your-key-name"
  associate_public_ip_address = true
  tags = {
    "Name" = "kubernetes-t2g2-backend${count.index}"
  }
  vpc_security_group_ids = [data.aws_security_group.selected.id]
    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-17-jdk
    sudo apt-get install -y docker.io
    sudo apt-get install openssh-server -y
    echo "export ACC_SVC_DB_PASS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_DB_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_DB_USER=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_NAME=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_PORT=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_USER=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_PASS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_PORT=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_DB_PASS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_DB_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_DB_USER=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_NAME=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_PORT=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_SECRET_BACKEND=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_ID_BACKEND=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_SECRET_USERS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_ID_USERS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_SERVER_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export REALM_TOKEN_URI=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export JWT_ISSUER_URI=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    sudo apt install maven -y
  EOF 
}

resource "aws_instance" "t2grupo2-ansible" {
  count         = 1
  ami           = var.ami
  instance_type = var.tipo_instancia
  subnet_id     = "subnet-02ef0d140a6c2a4a8"
  key_name      = "your-key-name"
  associate_public_ip_address = true
  tags = {
    "Name" = "ansible-t2g2-backend${count.index}"
  }
    vpc_security_group_ids = [data.aws_security_group.selected.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
    sudo apt-get install -y openjdk-17-jdk
    sudo apt-get install -y docker.io
    sudo apt-get install openssh-server -y
    echo "export ACC_SVC_DB_PASS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_DB_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_DB_USER=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_NAME=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export ACC_SVC_PORT=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_USER=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_PASS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_PORT=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_DB_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_DB_PASS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_DB_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_DB_USER=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_NAME=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export USR_SVC_PORT=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_SECRET_BACKEND=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_ID_BACKEND=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_SECRET_USERS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export CLIENT_ID_USERS=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export KEYCLOAK_SERVER_URL=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export REALM_TOKEN_URI=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    echo "export JWT_ISSUER_URI=" | sudo tee -a /etc/profile.d/script.sh && source /etc/profile.d/script.sh
    sudo apt install maven -y
  EOF  
}