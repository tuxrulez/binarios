#!/bin/bash

data=`date '+%d/%m/%Y'`

rede="GBarbosa_TV"

arquivo="VV_350_AOC_Futuro_Digital_030210"

>${rede}_lojas_com_conteudo
>${rede}_lojas_sem_conteudo
>${rede}_lojas_ausente
>${rede}_estatisticas

ls /home/tv/${rede}/sql/ | grep 'AA_0001' | while read loja
do
	log=`ls /logs_novo/tv/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep ${arquivo} | grep 'Video'`
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

ls /home/tv/${rede}/sql/ | grep 'AL' | while read loja
do
	log=`ls /logs_novo/tv/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep ${arquivo} | grep 'Video'`
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

ls /home/tv/${rede}/sql/ | grep 'BA' | while read loja
do
	log=`ls /logs_novo/tv/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep ${arquivo} | grep 'Video'`
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

ls /home/tv/${rede}/sql/ | grep 'SE' | while read loja
do
	log=`ls /logs_novo/tv/${rede}/*status* | grep $loja`	
	if [ "$log" != "" ]
	then
        	arqu=`zcat $log | grep ${arquivo} | grep 'Video'`
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

s1=`ls /home/tv/${rede}/sql/ | grep 'AA_0001' | wc -l`

s2=`ls /home/tv/${rede}/sql/ | grep 'AL' | wc -l`

s3=`ls /home/tv/${rede}/sql/ | grep 'BA' | wc -l`

s4=`ls /home/tv/${rede}/sql/ | grep 'SE' | wc -l`

total=$(($s1+$s2+$s3+$s4))

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
