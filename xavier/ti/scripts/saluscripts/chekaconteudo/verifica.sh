#!/bin/bash

# Script para verificar diferencas entre as lojas existentes no profxavier e as cadastradas no safira na base de log
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2010-06-30

rede="$1"

loja="$2"

> loja_com_conteudo_programado.txt
> loja_sem_conteudo_programado.txt
> loja_ok_conteudo_programado.txt
> loja_conteudo_alem_programado.txt

zcat /mnt/hd500/logs_novo/radio/${rede}/${rede}_${loja}_status.zip | grep mp3 > conteudo_loja.txt

ls /mnt/hd500/sistema/radio/${rede}/generos/${loja}/* | grep mp3 > conteudo_xavier.txt


cat conteudo_xavier.txt | while read xavier
do
	cheka=`cat conteudo_loja.txt | grep "${xavier}"`

	if [ "$cheka" != "" ]
	then
		echo ${xavier} >> loja_com_conteudo_programado.txt
	else
		echo ${xavier} >> loja_sem_conteudo_programado.txt
	fi
done

cat conteudo_loja.txt | while read loja
do
	cheka=`cat conteudo_xavier.txt | grep "${loja}"`

	if [ "$cheka" != "" ]
	then
		echo ${loja} >> loja_ok_conteudo_programado.txt
	else
		echo ${loja} >> loja_conteudo_alem_programado.txt
	fi
done
