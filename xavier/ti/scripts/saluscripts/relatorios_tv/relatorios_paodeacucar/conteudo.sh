#!/bin/bash

data=`date '+%d/%m/%Y'`

rede="Pao_Elevadores"

arquivo="Pao_Elevadores - Bacalhau 120410 (FULL) - 122.mpg"

>${rede}_lojas_com_conteudo
>${rede}_lojas_sem_conteudo
>${rede}_lojas_ausente
>${rede}_estatisticas

ls /home/tv/${rede}/sql/ | grep -v '000' | grep -v 'A' | grep -v 'Lorena_Beija' | grep -v 'Melannet_Restaurante_Inf' | while read loja
do
	log=`ls /logs_novo/tv/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep 'Pao_Elevadores - Bacalhau 120410 (FULL) - 122.mpg'`
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

total=`ls /home/tv/${rede}/sql/ | grep -v '000' | grep -v 'A' | grep -v 'Lorena_Beija' | grep -v 'Melannet_Restaurante_Inf' | wc -l`

atual=`cat ${rede}_lojas_com_conteudo | wc -l`

desat=$(($total-$atual))

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
echo " Total de Lojas       = ${total} "                                        >> ${rede}_estatisticas
echo " Lojas Atualizadas    = ${atual} "                                        >> ${rede}_estatisticas
echo " Lojas Desatualizadas = ${desat}"                                         >> ${rede}_estatisticas
echo " "                                                                        >> ${rede}_estatisticas
