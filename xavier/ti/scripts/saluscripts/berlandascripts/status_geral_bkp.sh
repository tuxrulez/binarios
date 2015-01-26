#!/bin/bash

# Script que realiza um parecer de campo com status do dia relevantes a maquina on/off, versao mobox e satelite on/off.
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2012-07-18

# Variaveis de uso global no script.
data=`date '+%Y-%m-%d'`
data_exibicao=`date '+%d/%m/%Y - %H:%M:%S'`
rede="berlanda"
path_base="/home/saluscripts/${rede}scripts"
path_logs="/mnt/hd500/logs_novo/tv_new/${rede}"
path_lojas="/var/www/mobger/mobger/media/clients_export/${rede}"

# Inicio da Rotina
ls ${path_lojas}/ > ${path_base}/lojas.txt

> ${path_base}/logs_ausente.txt
> ${path_base}/ultimaversao.txt
> ${path_base}/versaoanterior.txt
> ${path_base}/satelite_on.txt
> ${path_base}/satelite_off.txt
> ${path_base}/lojas_on.txt
> ${path_base}/lojas_off.txt
> ${path_base}/resumo.txt

cat ${path_base}/lojas.txt | while read lojas
do
        log=`ls ${path_logs}/ | grep ${rede}_${lojas}_status.zip`
        if [ "${log}" != "" ]
        then
                script=`zcat ${path_logs}/${rede}_${lojas}_status.zip | grep -i 'Versao do Sistema Mobox' | cut -d '=' -f2 | cut -d ' ' -f2-3 | head -n1`
                if [ "${script}" == "Mobox 1.1.1" ]
                then
                        echo "${lojas} : ${script}" >> ${path_base}/ultimaversao.txt
                else
                        echo "${lojas} : ${script}" >> ${path_base}/versaoanterior.txt
                fi
		data_log=`stat ${path_logs}/${rede}_${lojas}_status.zip | grep Modify | tail -n1 | cut -d " " -f2`
		if [ "${data}" == "${data_log}" ]
		then
			echo "${lojas}" >> ${path_base}/lojas_on.txt
                	satelite=`zcat ${path_logs}/${rede}_${lojas}_status.zip | grep -i 'Sinal de Satelite' | cut -d '=' -f2 | cut -d ' ' -f2 | head -n1`
                	if [ "${satelite}" == "PRESENTE" ]
	                then
        	                echo "${lojas} : ${satelite}" >> ${path_base}/satelite_on.txt
                	else
                        	echo "${lojas} : ${satelite}" >> ${path_base}/satelite_off.txt
	                fi
		else
			echo "${lojas}" >> ${path_base}/lojas_off.txt
                        echo "${lojas} : ${satelite}" >> ${path_base}/satelite_off.txt
		fi
        else
                echo "${lojas}" >> ${path_base}/logs_ausente.txt
        fi
done

# Gera um resumo do fato
total_lojas=`cat ${path_base}/lojas.txt | wc -l`
lojas_on=`cat ${path_base}/lojas_on.txt | wc -l`
lojas_off=$((${total_lojas}-${lojas_on}))
satelite_on=`cat ${path_base}/satelite_on.txt | wc -l`
satelite_off=$((${total_lojas}-${satelite_on}))
ultima_versao=`cat ${path_base}/ultimaversao.txt | wc -l`
versao_anterior=$((${total_lojas}-${ultima_versao}))
lojas_on_p=$((${lojas_on}*100/${total_lojas}))
lojas_off_p=$((${lojas_off}*100/${total_lojas}))
satelite_on_p=$((${satelite_on}*100/${total_lojas}))
satelite_off_p=$((${satelite_off}*100/${total_lojas}))
ultima_versao_p=$((${ultima_versao}*100/${total_lojas}))
versao_anterior_p=$((${versao_anterior}*100/${total_lojas}))

echo "****************************************************" >> ${path_base}/resumo.txt
echo "Resumo gerado em ${data_exibicao}" >> ${path_base}/resumo.txt
echo "Total de Maquinas Cadastradas no Sistema = ${total_lojas}" >> ${path_base}/resumo.txt
echo "Total de Maquinas ON = ${lojas_on} - ${lojas_on_p} % do total" >> ${path_base}/resumo.txt
echo "Total de Maquinas OFF = ${lojas_off} - ${lojas_off_p} % do total" >> ${path_base}/resumo.txt
echo "Total de Maquinas com Sinal de Satelite ON = ${satelite_on} - ${satelite_on_p} % do total" >> ${path_base}/resumo.txt
echo "Total de Maquinas com Sinal de Satelite OFF = ${satelite_off} - ${satelite_off_p} % do total" >> ${path_base}/resumo.txt
echo "Total de Maquinas com Ultima Versao da Mobox = ${ultima_versao} - ${ultima_versao_p} % do total" >> ${path_base}/resumo.txt
echo "Total de Maquinas SEM a Ultima Versao da Mobox = ${versao_anterior} - ${versao_anterior_p} % do total" >> ${path_base}/resumo.txt
echo "Total de Maquinas com Conteudo Completo = " >> ${path_base}/resumo.txt
echo "****************************************************" >> ${path_base}/resumo.txt
