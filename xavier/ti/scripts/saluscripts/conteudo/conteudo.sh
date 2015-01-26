#!/bin/bash


data=`date '+%d/%m/%Y'`

#arquivo='TV_Colaboradores_Especial'

#>testando.txt
>colombo_conteudo

#ls /logs_novo/tv/Lojas_Colombo_TV/*status* | sort | while read loja
#do
#    nomeLoja=`echo $loja | sed 's/\/logs_novo\/tv\/Lojas_Colombo_TV\/Lojas_Colombo_TV_//g' | sed 's/_status.zip//g'`	
#    conteudo=`zcat /logs_novo/tv/Lojas_Colombo_TV/Lojas_Colombo_TV_"$nomeLoja"_status.zip | grep $arquivo`
#	echo " "         >>testando.txt
#	echo $nomeLoja   >>testando.txt
#	echo $conteudo   >>testando.txt
#	echo " "         >>testando.txt
#done


ls /logs_novo/tv/Lojas_Colombo_TV/*status* | grep -v 'Servidor' | grep -v 'server' | while read loja
do
        nome=`echo $loja | sed 's/\/logs_novo\/tv\/Lojas_Colombo_TV\/Lojas_Colombo_TV_//g' | sed 's/_status.zip//g'`

        zcat $loja | grep 'TV_Colaboradores_Especial' | grep 'Video' | while read conteudo
        do
               echo $nome:$conteudo | sed 's/\/usr\/local\/tv\/generos\/comercial\/VV_205_TVColombo//g' >> colombo_conteudo
        done

done




