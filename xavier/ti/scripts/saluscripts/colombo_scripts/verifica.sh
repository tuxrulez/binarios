#!/bin/bash

ls /mnt/hd500/sistema/tv/Lojas_Colombo_TV/sql/ | grep -v '^000' | grep -v AAA_Vitrine_Virtual | grep -v AAProgramacao | grep -v EVT_0001 > /home/saluscripts/colombo_scripts/lojas.txt

> /home/saluscripts/colombo_scripts/logs_ausente.txt
> /home/saluscripts/colombo_scripts/com_scripts.txt
> /home/saluscripts/colombo_scripts/sem_scripts.txt

cat /home/saluscripts/colombo_scripts/lojas.txt | while read lojas
do
	cheka=`ls /mnt/hd500/logs_novo/tv/Lojas_Colombo_TV/ | grep Lojas_Colombo_TV_${lojas}_status.zip`
	if [ "$cheka" != "" ]
	then
		#script=`zcat /mnt/hd500/logs_novo/tv/Lojas_Colombo_TV/Lojas_Colombo_TV_${lojas}_status.zip | grep 'Version_Script=2012-04-17'`
		script=`zcat /mnt/hd500/logs_novo/tv/Lojas_Colombo_TV/Lojas_Colombo_TV_${lojas}_status.zip | grep 'Version_Script = 2013-02-27'`
		if [ "$script" != "" ]
		then
			echo "${lojas}" >> /home/saluscripts/colombo_scripts/com_scripts.txt
		else
			echo "${lojas}" >> /home/saluscripts/colombo_scripts/sem_scripts.txt
		fi
	else
		echo "${lojas}" >> /home/saluscripts/colombo_scripts/logs_ausente.txt
	fi

done
