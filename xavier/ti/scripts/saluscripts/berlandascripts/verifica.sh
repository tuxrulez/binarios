#!/bin/bash

ls /var/www/mobger/mobger/media/clients_export/berlanda > /home/saluscripts/berlandascripts/lojas.txt

> /home/saluscripts/berlandascripts/logs_ausente.txt
> /home/saluscripts/berlandascripts/ultimaversao.txt
> /home/saluscripts/berlandascripts/versaoanterior.txt

cat /home/saluscripts/berlandascripts/lojas.txt | while read lojas
do
        cheka=`ls /mnt/hd500/logs_novo/tv_new/berlanda | grep berlanda_${lojas}_status.zip`
        if [ "$cheka" != "" ]
        then
                script=`zcat /mnt/hd500/logs_novo/tv_new/berlanda/berlanda_${lojas}_status.zip | grep -i 'Versao do Sistema Mobox' | cut -d '=' -f2 | cut -d ' ' -f2-3`
                if [ "$script" == "Mobox 1.1.1" ]
                then
                        echo "${lojas} : ${script}" >> /home/saluscripts/berlandascripts/ultimaversao.txt
                else
                        echo "${lojas} : ${script}" >> /home/saluscripts/berlandascripts/versaoanterior.txt
                fi
        else
                echo "${lojas}" >> /home/saluscripts/berlandascripts/logs_ausente.txt
        fi
done
