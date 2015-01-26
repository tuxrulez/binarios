#!/bin/bash

data=`date`

rede="Makro"

#arquivo="Makro - Spot_Seda.mp3"

arquivo="$1"

>${rede}_lojas_com_conteudo
>${rede}_lojas_sem_conteudo
>${rede}_lojas_ausente
>${rede}_estatisticas

ls /mnt/hd500/sistema/radio/Makro/sql/ | grep -v '^000' | grep -v 'A' | while read loja
do
	log=`ls /mnt/hd500/logs_novo/radio/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep "${arquivo}"`
		if [ "$arqu" != "" ]
		then
			echo $loja >> ${rede}_lojas_com_conteudo
		else
			echo $loja >> ${rede}_lojas_sem_conteudo
		fi
	else
		echo $loja >> ${rede}_lojas_ausente
	fi
done

total=`ls /mnt/hd500/sistema/radio/Makro/sql/ | grep -v '^000' | grep -v 'A' | wc -l`
atual=`cat ${rede}_lojas_com_conteudo | wc -l`
desat=$(($total-$atual))

echo " "                                                                        >> ${rede}_estatisticas
echo "Relatório do arquivo  ${arquivo}  gerado   ${data} "                      >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "**********************************"                                       >> ${rede}_estatisticas
echo "Lojas com o conteúdo = "`cat ${rede}_lojas_com_conteudo | wc -l`          >> ${rede}_estatisticas
echo "**********************************"                                       >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "$(cat ${rede}_lojas_com_conteudo)"                                        >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "**********************************"                                       >> ${rede}_estatisticas
echo "Lojas SEM o conteúdo = "`cat ${rede}_lojas_sem_conteudo | wc -l`          >> ${rede}_estatisticas
echo "**********************************"                                       >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "$(cat ${rede}_lojas_sem_conteudo)"                                        >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "**********************************"                                       >> ${rede}_estatisticas
echo "Lojas com Logs AUSENTES = "`cat ${rede}_lojas_ausente | wc -l`            >> ${rede}_estatisticas
echo "**********************************"                                       >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "$(cat ${rede}_lojas_ausente)"                                             >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo " Total de Lojas       = ${total}"                                         >> ${rede}_estatisticas
echo " Lojas Atualizadas    = ${atual}"                                         >> ${rede}_estatisticas
echo " Lojas Desatualizadas = ${desat}"                                         >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
