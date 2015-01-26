#!/bin/bash

data=`date`

rede="Centauro_Esportes"

#arquivo="$1"

#arquivo="Centauro_Esportes - Dicas Esporte E Saude-10.mp3"

path_relatorio="/ti/scripts/saluscripts/relatorios_radio/relatorios_centauro"
path_sistema="/mnt/hd500/sistema/radio"
path_registro="/mnt/hd500/logs_novo/radio"

#> ${path_relatorio}/${rede}_lojas_com_conteudo.txt
#> ${path_relatorio}/${rede}_lojas_sem_conteudo.txt
#> ${path_relatorio}/${rede}_lojas_ausente.txt
#> ${path_relatorio}/${rede}_estatisticas.txt
> ${path_relatorio}/${rede}_falta_conteudo.txt
> ${path_relatorio}/${rede}_naofalta_conteudo.txt


ls ${path_sistema}/${rede}/sql/ | grep CE | while read loja
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

#	log=`ls ${path_registro}/${rede}/${rede}_${loja}_status.zip | grep $loja`
#	if [ "$log" != "" ]
#	then
#		arqu=`zcat $log | grep "${arquivo}"`
#		if [ "$arqu" != "" ]
#		then
#			echo $loja >> ${path_relatorio}/${rede}_lojas_com_conteudo.txt
#		else
#			echo $loja >> ${path_relatorio}/${rede}_lojas_sem_conteudo.txt
#		fi
#	else
#		echo $loja >> ${path_relatorio}/${rede}_lojas_ausente.txt
#	fi
done

#total=`ls ${path_sistema}/${rede}/sql/ | grep CE | wc -l`
#atual=`cat ${path_relatorio}/${rede}_lojas_com_conteudo.txt | wc -l`
#desat=$(($total-$atual))

#echo " "                                                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "Relat�rio do arquivo  ${arquivo}  gerado  ${data} "                                       >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " Total de Lojas        = ${total}"                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " Lojas Atualizadas     = ${atual}"                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " Lojas Desatualizadas  = ${desat}"                                                        >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                        >> ${path_relatorio}/${rede}_estatisticas.txt


#echo "**********************************"                                                          >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "Lojas com o conteúdo = "cat ${path_relatorio}/${rede}_lojas_com_conteudo.txt | wc -l`       >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "**********************************"                                                          >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                           >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "$(cat ${path_relatorio}/${rede}_lojas_com_conteudo.txt)"                                     >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                           >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "**********************************"                                                          >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "Lojas SEM o conteúdo = "`at ${path_relatorio}/${rede}_lojas_sem_conteudo.txt | wc -l`       >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "**********************************"                                                          >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                           >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "$(cat ${path_relatorio}/${rede}_lojas_sem_conteudo.txt)"                                     >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                           >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "**********************************"                                                          >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "Lojas com Logs AUSENTES = "`cat ${path_relatorio}/${rede}_lojas_ausente.txt | wc -l`         >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "**********************************"                                                          >> ${path_relatorio}/${rede}_estatisticas.txt
#echo " "                                                                                           >> ${path_relatorio}/${rede}_estatisticas.txt
#echo "$(cat ${path_relatorio}/${rede}_lojas_ausente.txt)"                                          >> ${path_relatorio}/${rede}_estatisticas.txt
