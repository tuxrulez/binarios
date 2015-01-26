#!/bin/bash

# Script que compara dois arquivos e identifica as lojas divergentes
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2010-07-02

data=`date '+%d-%m-%Y'`

rede="$1"

arquivo="$2"

> lojas_ok.txt
> lojas_divergentes.txt
> lojas_estatisticas.txt

cat mandaram_logs.txt | while read loja
do
	compara=`cat atualizaram_conteudo.txt | grep $loja`
	if [ "$compara" != "" ]
	then
		echo $loja >> lojas_ok.txt
	else
		echo $loja >> lojas_divergentes.txt
	fi
done

total_lojas=`cat mandaram_logs.txt | wc -l`
total_ok=`cat lojas_ok.txt | wc -l`
total_diver=`cat lojas_divergentes.txt | wc -l`


echo " Relatorio da rede $rede gerado dia $data "   >> lojas_estatisticas.txt                   
echo "***********************************"          >> lojas_estatisticas.txt
echo " Total de lojas  =  $total_lojas "            >> lojas_estatisticas.txt
echo " Total de lojas atualizadas = $total_ok "     >> lojas_estatisticas.txt
echo " Total de lojas divergentes = $total_diver "  >> lojas_estatisticas.txt
echo "***********************************"          >> lojas_estatisticas.txt
