#!/bin/bash

data=`date`

rede="Centauro_Esportes"

path_relatorio="/ti/scripts/saluscripts/relatorios_radio/relatorios_centauro/conteudo_mb"
path_sistema="/mnt/hd500/sistema/radio/${rede}/generos/000"

> ${path_relatorio}/conteudo_geral.txt
> ${path_relatorio}/tamanho_geral.txt

cat ${path_relatorio}/base.txt | while read pasta
do
	ls ${path_sistema}/${pasta} | grep mp3 > ${path_relatorio}/${pasta}_conteudo.txt

	du -sh ${path_sistema}/${pasta}/* > ${path_relatorio}/${pasta}_tamanho.txt

	cat ${path_relatorio}/${pasta}_conteudo.txt | while read conteudo
	do
		igual=`cat ${path_relatorio}/${pasta}_conteudo.txt | grep mp3`
		if [ "$igual" != "" ]
		then
			echo "${conteudo}" >> ${path_relatorio}/conteudo_geral.txt
		fi
	done

	cat ${path_relatorio}/${pasta}_tamanho.txt | while read tamanho
	do
		igual=`cat ${path_relatorio}/${pasta}_tamanho.txt | grep mp3`
		if [ "$igual" != "" ]
		then
			echo "${tamanho}" >> ${path_relatorio}/tamanho_geral.txt
		fi
	done
done
