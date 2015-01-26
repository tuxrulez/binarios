#!/bin/bash

ls /mnt/hd500/sistema/tv/Condor_TV/sql/ | grep -v '^000' | grep -v AAA_Vitrine_Virtual | grep -v AAProgramacao | grep -v EVT_0001 | grep -v AASede > /home/saluscripts/condor_scripts/lojas.txt

> /home/saluscripts/condor_scripts/logs_ausente.txt
> /home/saluscripts/condor_scripts/com_scripts.txt
> /home/saluscripts/condor_scripts/sem_scripts.txt

cat /home/saluscripts/condor_scripts/lojas.txt | while read lojas
do
	cheka=`ls /mnt/hd500/logs_novo/tv/Condor_TV/ | grep Condor_TV_${lojas}_status.zip`
	if [ "$cheka" != "" ]
	then
		script=`zcat /mnt/hd500/logs_novo/tv/Condor_TV/Condor_TV_${lojas}_status.zip | grep 'Version_Script = 2013-05-21'`
		if [ "$script" != "" ]
		then
			echo "${lojas}" >> /home/saluscripts/condor_scripts/com_scripts.txt
		else
			echo "${lojas}" >> /home/saluscripts/condor_scripts/sem_scripts.txt
		fi
	else
		echo "${lojas}" >> /home/saluscripts/condor_scripts/logs_ausente.txt
	fi

done
