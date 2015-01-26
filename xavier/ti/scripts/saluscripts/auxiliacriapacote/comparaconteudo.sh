ls /var/www/mobger/mobger/media/clients_export/berlanda/ > /home/saluscripts/auxiliacriapacote/lojas.txt

> /home/saluscripts/colombo_scripts/logs_ausente.txt
> /home/saluscripts/colombo_scripts/com_scripts.txt
> /home/saluscripts/colombo_scripts/sem_scripts.txt
> /home/saluscripts/colombo_scripts/corrigidas.txt
> /home/saluscripts/colombo_scripts/falta_corrigir.txt

cat /home/saluscripts/colombo_scripts/lojas.txt | while read lojas
do
	cheka=`ls /mnt/hd500/logs_novo/tv/Lojas_Colombo_TV/ | grep Lojas_Colombo_TV_${lojas}_status.zip`
	if [ "$cheka" != "" ]
	then
		script=`zcat /mnt/hd500/logs_novo/tv/Lojas_Colombo_TV/Lojas_Colombo_TV_${lojas}_status.zip | grep log-status | grep '20 06,14'`
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

cat /home/saluscripts/colombo_scripts/stender.txt | while read lojas
do
	cheka=`cat /home/saluscripts/colombo_scripts/com_scripts.txt | grep ${lojas}`
	if [ "$cheka" != "" ]
	then
        	echo "${lojas}" >> /home/saluscripts/colombo_scripts/corrigidas.txt
	else
        	echo "${lojas}" >> /home/saluscripts/colombo_scripts/falta_corrigir.txt
	fi
done

