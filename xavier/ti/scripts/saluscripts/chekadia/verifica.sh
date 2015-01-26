#!/bin/bash

# Script que identifica as falhas (rsync, envio de logs, atualizacao) nas lojas da rede Dia%
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2010-07-05

rede="Dia_Sup"

data=`date '+%d/%m/%Y  %H:%M'`

# Lojas que tem registro de rsync, enviam logs e atualizam
> lojas_ok.txt

# Lojas que enviam logs e nao consta registro de rsync
> lojas_sem_rsync.txt

# Lojas que tem registro de rsync mas nao enviam logs 
> lojas_nao_enviam_log.txt

# Lojas que tem registro de rsync, enviam logs mas nao atualizam
> lojas_nao_atualizam.txt

# Lojas que estao atualizadas mas fora da rede hoje
> lojas_atualizadas_foradarede.txt


# Etapa que verifica as lojas pelos logs

cat dia_logs.txt | while read log
do
	ver_rsync=`cat dia_rsync.txt | grep $log`
	ver_atual=`cat dia_atualizadas.txt | grep $log`
	
	if [ "$ver_rsync" != "" ]
	then
		if [ "$ver_rsync" != "" -a "$ver_atual" != "" ]
		then
			echo $log >> lojas_ok.txt
		else
			echo $log >> lojas_nao_atualizam.txt
		fi
	else
		echo $log >> lojas_sem_rsync.txt
	fi	
done

cat dia_rsync.txt | while read rsync
do
	ver_logs=`cat dia_logs.txt | grep $rsync`

	if [ "$ver_logs" = "" ]
	then
		echo $rsync >> lojas_nao_enviam_log.txt
	fi
done

cat dia_atualizadas.txt | while read atual
do
	ver_logs=`cat dia_logs.txt | grep $atual`

	if [ "$ver_logs" = "" ]
	then
		echo $atual >> lojas_atualizadas_foradarede.txt
	fi
done
