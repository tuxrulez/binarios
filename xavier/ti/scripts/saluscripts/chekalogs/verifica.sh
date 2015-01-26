#!/bin/bash

# Script para verificar diferencas entre as lojas existentes no profxavier e as cadastradas no safira na base de log
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2010-06-30


> loja_em_rede_comlog.txt
> loja_em_rede_semlog.txt

cat lojas_em_rede.txt | while read rede
do
	cheka=`cat lojas_mandaram_log.txt | grep "${rede}"`

	if [ "$cheka" != "" ]
	then
		echo ${rede} >> loja_em_rede_comlog.txt
	else
		echo ${rede} >> loja_em_rede_semlog.txt
	fi
done
