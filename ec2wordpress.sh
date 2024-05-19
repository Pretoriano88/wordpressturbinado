#!/bin/bash

# Atualiza os repositórios e instala os pacotes necessários
sudo yum update -y
sudo yum install -y curl ansible unzip

# Download e extração dos arquivos
cd /tmp
sudo wget https://projetoformacaosrelumr921298290312.s3.us-west-1.amazonaws.com/ansible.zip 
sudo unzip ansible.zip -d /tmp
cd /tmp/ansible/

# Executa o playbook do Ansible com as variáveis especificadas
sudo ansible-playbook playbook.yml \
--extra-vars "wp_db_name=${wp_db_name} wp_username=${wp_username} wp_user_password=${wp_user_password} wp_db_host=${wp_db_host}"

# Download e execução do script node_exporter.sh
sudo wget https://projetoformacaosrelumr921298290312.s3.us-west-1.amazonaws.com/node_exporter.sh
sudo sh node_exporter.sh
