#!/bin/bash

# Script que sincroniza com o servidor algum script para atualizar a maquina 
# 2012-02-15

rede="Pao_de_Acucar"
loja=`echo "select loja from programacoes" | mysql radio | tail -n1`
ip="10.160.100.2"

# Efetua o sincronismo da aplicacao se houve atualizacao
aplicacao=`/usr/bin/rsync -razv --copy-links --delete --password-file=/etc/radio.update rsync://$rede@$ip:873:/$rede/scripts/$loja/ /usr/local/scripts`

echo $aplicacao | grep -e 'atualiza.sh'

if [ $? == 0 -a -f /usr/local/scripts/atualiza.sh ]; then
    /usr/local/scripts/atualiza.sh
fi
