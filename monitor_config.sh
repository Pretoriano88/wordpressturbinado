#!/bin/bash

# Instalação do Docker e Docker Compose
sudo apt install -y docker
sudo systemctl start docker
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Download do arquivo Prometheus e Grafana
wget https://projetoformacaosrelumr921298290312.s3.us-west-1.amazonaws.com/prometheus_grafana.zip

# Instalação do unzip
sudo apt install -y unzip

# Extração do arquivo zip
unzip prometheus_grafana.zip
cd prometheus_grafana

# Criação da rede Docker
sudo docker network create monitoring

# Inicialização dos contêineres do Docker com Docker Compose
sudo /usr/local/bin/docker-compose up -d
