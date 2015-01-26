#!/bin/bash

# Script para verificar diferencas entre as lojas existentes no profxavier e as cadastradas no safira na base de log
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2010-06-30

rede="$1"

> loja_cadastrada_safira.txt
> loja_para_cadastrar_safira.txt
> loja_ja_cadastrada.txt
> loja_para_excluir_safira.txt


cat /ti/scripts/saluscripts/safira/${rede}/${rede}.txt > arquivo_profxavier.txt

cat arquivo_profxavier.txt | while read xavier
do
	cheka=`cat arquivo_safira.txt | grep $xavier`

	if [ "$cheka" != "" ]
	then
		echo $xavier >> loja_cadastrada_safira.txt
	else
		echo $xavier >> loja_para_cadastrar_safira.txt
	fi
done

cat arquivo_safira.txt | while read safira
do
	cheka=`cat arquivo_profxavier.txt | grep $safira`

	if [ "$cheka" != "" ]
	then
		echo $safira >> loja_ja_cadastrada.txt
	else
		echo $safira >> loja_para_excluir_safira.txt
	fi
done
