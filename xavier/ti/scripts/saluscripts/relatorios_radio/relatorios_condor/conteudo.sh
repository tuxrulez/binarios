#!/bin/bash

data=`date`

rede="Condor"

#arquivo="$1"

path_relatorio="/ti/scripts/saluscripts/relatorios_radio/relatorios_condor"
path_sistema="/mnt/hd500/sistema/radio"
path_registro="/mnt/hd500/logs_novo/radio"

> ${path_relatorio}/${rede}_estatisticas.txt
> ${path_relatorio}/${rede}_falta_conteudo.txt
> ${path_relatorio}/${rede}_naofalta_conteudo.txt


ls ${path_sistema}/${rede}/sql/ | grep -v '000' | grep -v 'AAProgramacao' | grep -v 'AATeste' | while read loja
do
	ls ${path_sistema}/${rede}/generos/$loja/* | grep mp3 > ${path_relatorio}/${loja}_conteudo_xavier.txt
	zcat ${path_registro}/${rede}/${rede}_${loja}_status.zip | grep mp3 > ${path_relatorio}/${loja}_conteudo_loja.txt
	> ${path_relatorio}/${loja}_conteudo_certo.txt
	> ${path_relatorio}/${loja}_conteudo_faltante.txt

	cat ${path_relatorio}/${loja}_conteudo_xavier.txt | while read conteudo
	do
		igual=`cat ${path_relatorio}/${loja}_conteudo_loja.txt | grep "${conteudo}"`
		if [ "$igual" != "" ]
		then
			echo "${conteudo}" >> ${path_relatorio}/${loja}_conteudo_certo.txt
		else
			echo "${conteudo}" >> ${path_relatorio}/${loja}_conteudo_faltante.txt
		fi
	done

	diverge=`cat ${path_relatorio}/${loja}_conteudo_faltante.txt | grep mp3`
	if [ "$diverge" != "" ]
	then
		echo $loja >> ${path_relatorio}/${rede}_falta_conteudo.txt
	else
		echo $loja >> ${path_relatorio}/${rede}_naofalta_conteudo.txt
	fi
done

total=`ls ${path_sistema}/${rede}/sql/ | grep -v '000' | grep -v 'AAProgramacao' | grep -v 'AATeste' | wc -l`
completo=`cat ${path_relatorio}/${rede}_naofalta_conteudo.txt | wc -l`
faltante=$(($total-$completo))

echo " "                                                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
echo "Relatorio da rede  ${rede}  gerado  ${data} "                                             >> ${path_relatorio}/${rede}_estatisticas.txt
echo " "                                                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
echo " Total de Lojas                = ${total}"                                                >> ${path_relatorio}/${rede}_estatisticas.txt
echo " Lojas Com Conteudo Completo   = ${completo}"                                             >> ${path_relatorio}/${rede}_estatisticas.txt
echo " Lojas Faltando Conteudo       = ${faltante}"                                             >> ${path_relatorio}/${rede}_estatisticas.txt
echo " "                                                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
