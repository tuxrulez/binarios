#!/bin/bash

data=`date '+%d/%m/%Y'`

rede="Condor"

arquivo="Condor - Spot Neve Ate 100610.mp3"

>${rede}_lojas_com_conteudo
>${rede}_lojas_sem_conteudo
>${rede}_lojas_ausente
>${rede}_estatisticas

ls /home/radio/Condor/sql/ | grep -v '000' | grep -v 'AAProgramacao' | grep -v 'AATeste' | while read loja
do
	log=`ls /logs_novo/radio/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep 'Condor - Spot Neve Ate 100610.mp3'`
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

echo " "                                                                        >> ${rede}_estatisticas
echo "${rede} "                                                                 >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
echo "Relatório do arquivo  ${arquivo}  gerado dia ${data} "                    >> ${rede}_estatisticas
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
echo " Total de Lojas       = "`ls /home/radio/Condor/sql/ | grep -v '000' | grep -v 'AAProgramacao' | grep -v 'AATeste' | wc -l`  >> ${rede}_estatisticas
echo " Lojas Atualizadas    = "`cat ${rede}_lojas_com_conteudo | wc -l`         >> ${rede}_estatisticas

total=`ls /home/radio/Condor/sql/ | grep -v '000' | grep -v 'AAProgramacao' | grep -v 'AATeste' | wc -l`
atual=`cat ${rede}_lojas_com_conteudo | wc -l`
desat=$(($total-$atual))

echo " Lojas Desatualizadas = ${desat}"                                         >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
