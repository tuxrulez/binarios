#!/bin/bash

# Script que realiza o link do arquivo no diretorio 000 para as demais lojas publicadas.
# 2012-02-15

ls | grep -v adiciona-update.sh | grep -v Pao_2012 | while read arquivo 
do
	ls ../ | grep -v ^000 | while read loja
	do
		#echo "criaria-se o link do arquivo $arquivo na $loja"
		ln -s ../000/$arquivo ../$loja/$arquivo
	done
done
