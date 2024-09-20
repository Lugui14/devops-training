#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Diretórios criados com sucesso!"

echo "Criando grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados com sucesso!"

echo "Criando usuários..."

useradd -m -s /bin/bash -g GRP_ADM -p $(openssl passwd -crypt 123456) carlos
useradd -m -s /bin/bash -g GRP_ADM -p $(openssl passwd -crypt 123456) maria
useradd -m -s /bin/bash -g GRP_ADM -p $(openssl passwd -crypt 123456) joao

useradd -m -s /bin/bash -g GRP_VEN -p $(openssl passwd -crypt 123456) debora
useradd -m -s /bin/bash -g GRP_VEN -p $(openssl passwd -crypt 123456) sebastiana
useradd -m -s /bin/bash -g GRP_VEN -p $(openssl passwd -crypt 123456) roberto

useradd -m -s /bin/bash -g GRP_SEC -p $(openssl passwd -crypt 123456) josefina
useradd -m -s /bin/bash -g GRP_SEC -p $(openssl passwd -crypt 123456) amanda
useradd -m -s /bin/bash -g GRP_SEC -p $(openssl passwd -crypt 123456) rogerio

echo "Usuários criados com sucesso!"

echo "Adicionando permissões..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Permissões adicionadas com sucesso!"

echo "Fim !"
