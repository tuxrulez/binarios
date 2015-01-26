#!/bin/bash

ls /var/www/mobger/mobger/media/clients_export/armazem_paraiba | grep -v backup > /home/saluscripts/armazemscripts/lojas.txt

> /home/saluscripts/armazemscripts/logs_ausente.txt
> /home/saluscripts/armazemscripts/ultimaversao.txt
> /home/saluscripts/armazemscripts/versaoanterior.txt

cat /home/saluscripts/armazemscripts/lojas.txt | while read lojas
do
        cheka=`ls /mnt/hd500/logs_novo/tv_new/armazem_paraiba | grep armazem_paraiba_${lojas}_status.zip`
        if [ "$cheka" != "" ]
        then
                script=`zcat /mnt/hd500/logs_novo/tv_new/armazem_paraiba/armazem_paraiba_${lojas}_status.zip | grep -i 'Versao do Sistema Mobox' | cut -d '=' -f2 | cut -d ' ' -f2-3`
                if [ "$script" == "Mobox 1.1.1" ]
                then
                        echo "${lojas} : ${script}" >> /home/saluscripts/armazemscripts/ultimaversao.txt
                else
                        echo "${lojas} : ${script}" >> /home/saluscripts/armazemscripts/versaoanterior.txt
                fi
        else
                echo "${lojas}" >> /home/saluscripts/armazemscripts/logs_ausente.txt
        fi
done
