#!/bin/bash

echo "Atualizando e instalando pacotes..."

apt-get update
apt-get upgrade -y
apt-get install apache2 unzip wget -y

echo "Baixando aplicação..."

mkdir -p /tmp
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

echo "Subindo servidor..."

mkdir -p /var/www/html
cd linux-site-dio-main
cp -R * /var/www/html