#!/bin/bash

# Script que cadastra as musicas que serao recebidas pela rede
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2012-02-15

# Variaveis de uso Global no script
path_base="/home/radiob"
path_musical="/usr/local/radio/generos/musical"
path_time="/usr/local/bin"
rede=`cat /var/www/html/config.inc.php | grep 'rede =' | cut -d "'" -f2`
loja=`cat /var/www/html/config.inc.php | grep 'loja =' | cut -d "'" -f2`

# Verifica se existe gettime na maquina
verifica=`ls ${path_time} | grep gettime`
if [ "$verifica" == "" ]
then
	cp -a /usr/bin/gettime ${path_time}/
fi

# Verifica a consistencia de bancos musicais
ls ${path_musical}/ > ${path_base}/banco_musical.txt
cat ${path_base}/banco_musical.txt | while read genero
do
	verifica=`ls ${path_musical}/${genero} | wc -l`
	if [ "$verifica" -eq 0 ]
	then
		rm -rf ${path_musical}/${genero}
	fi
done

# Limpa a base dados elimando os cadastros antigos de musica
echo "delete from arquivos where tipo='musical';" | mysql -u root radio
echo "delete from generos where tipo='musical';" | mysql -u root radio

# Insere as musicas no MySQL e corrige as permissoes
ls ${path_musical}/ > ${path_base}/banco_musical.txt
cat ${path_base}/banco_musical.txt | while read genero
do
	chown -R radiob. ${path_musical}/${genero}
	echo "insert into generos values ('musical', '${genero}');" | mysql -u root radio
	ls ${path_musical}/${genero}/ > ${path_base}/cadastra_musical.txt
	cat ${path_base}/cadastra_musical.txt | while read musica
	do
		tempo=`${path_time}/gettime ${path_musical}/${genero}/"${musica}"`
		echo "insert into arquivos values ('musical', '${genero}', '${musica}', '${tempo}', '2011-01-01', '2038-12-31', '1,2,3,4,5,6,7', 0, 86399, '${rede}', '${loja}', 'Nao');" | mysql -u root radio	
	done
done
