#!/bin/bash


ls /var/log/radio/*Comprebem*status* | grep -v 'Servidor' | while read loja
do
        nome=`echo $loja | sed 's/\/var\/log\/radio\///g' | sed 's/_status.zip//g'`

        zcat $loja | grep 'musical' | while read musical
        do
               echo $loja:$musical | sed 's/\/usr\/local\/radio\/generos\/musical\///g' >> comprebem_natal
        done

done
