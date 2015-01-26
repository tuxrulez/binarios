#!/bin/bash
#
# Adiciona usuario - padrao Megamidia

# Cria diretorio do usuario
mkdir /home/mm_users/$1

# Cria usuario:
# Home = /home/mm_users
# Grupo = mm
# Shell = menu
useradd $1 -d /home/mm_users/$1 -g mm -s /ti/scripts/menu

# Atribui permissoes no diretorio do usuario
chown $1.users -R /home/mm_users/$1

# Define a senha:
# Troca a cada 10 dias
# Avisa 3 dias antes de trocar
passwd -x 10 -w 3 $1
passwd $1
