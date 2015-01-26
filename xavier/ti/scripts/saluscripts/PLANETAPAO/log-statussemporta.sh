#!/bin/bash

# Script que gera e transfere o arquivo de log da máquina para o servidor
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2012-02-15

locate="/var/log/radio"

ip=`cat /usr/local/bin/radio-update.sh | grep ip= | cut -d '"' -f2`

hora=`cat /usr/local/bin/radio-update.sh | grep hora= | cut -d '"' -f2`

rede=`cat /srv/www/htdocs/config.inc.php | grep rede | cut -d "'" -f2`

loja=`cat /srv/www/htdocs/config.inc.php | grep loja | cut -d "'" -f2`

data=`date`

tempo=`uptime | cut -d "," -f1`

ip_loja=`/sbin/ifconfig | grep 'inet addr' | cut -d ":" -f2 | cut -d " " -f1 | head -n1`

ip_loja2=`/sbin/ifconfig | grep 'inet end' | cut -d ":" -f2 | cut -d " " -f2 | head -n1`

mask_loja=`/sbin/ifconfig | grep Mask | cut -d ":" -f4 | head -n1`

mask_loja2=`/sbin/ifconfig | grep Masc | cut -d ":" -f4 | head -n1`

gateway=`/sbin/route -n | grep UG | head -n 1 | cut -b17- | cut -f1 -d" "`

data_sql=`stat /srv/www/htdocs/radio.sql | grep Modify | tail -n1 | cut -d " " -f2`

data_zip=`stat /srv/www/htdocs/radio.zip | grep Modify | tail -n1 | cut -d " " -f2`

hd=`df -h | grep G`


# Cria o arquivo de log de status da CPU
/bin/echo Equipe de Tecnologia - MegaMidia Group > ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Setup da Maquina ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Rede =$rede >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Loja =$loja >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo DataCenter =$ip >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo ServidorHora =$hora >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
if [ "$ip_loja" != "" ]
then
/bin/echo IP =$ip_loja >> ${locate}/${rede}_${loja}_status.log
else
/bin/echo IP =$ip_loja2 >> ${locate}/${rede}_${loja}_status.log
fi
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
if [ "$mask_loja" != "" ]
then
/bin/echo MascaraRede =$mask_loja >> ${locate}/${rede}_${loja}_status.log
else
/bin/echo MascaraRede =$mask_loja2 >> ${locate}/${rede}_${loja}_status.log
fi
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Gateway =$gateway >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Dados da Maquina ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Data =$data >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Uptime =$tempo >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Data SQL =$data_sql >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Data ZIP =$data_zip >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Espaco do HD =$hd >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
free -m | head -n2 >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/cat /proc/version >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Crontab da Maquina ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/cat /etc/crontab >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Diretorio Comercial ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /usr/local/radio/generos/comercial/* | grep mp3 >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Diretorio Musical ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /usr/local/radio/generos/musical/ >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Tamanho do Banco Musical ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
du -h /usr/local/radio/generos/musical/ >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Linux Version ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/cat /proc/version >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ HD ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
df -h >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Memoria ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
free -m >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Processador ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/cat /proc/cpuinfo | grep 'vendor_id' >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/cat /proc/cpuinfo | grep 'model name' >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/cat /proc/cpuinfo | grep 'cpu MHz' >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Dispositivos PCI ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
lspci >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ IP ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/sbin/ifconfig >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Gateway ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/sbin/route -n >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Scripts da Maquina ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Scripts no bin >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /usr/local/bin/ >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Scripts no etc >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /usr/local/etc/ >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Scripts no scripts >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /usr/local/scripts/ >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo Scripts no crondaily >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /etc/cron.daily/ >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "====[ Conteudo Musical ]====" >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log
/bin/ls -lh /usr/local/radio/generos/musical/* >> ${locate}/${rede}_${loja}_status.log
/bin/echo "" >> ${locate}/${rede}_${loja}_status.log

# Compacta o arquivo de log recem criado
/usr/bin/zip -qj ${locate}/${rede}_${loja}_status ${locate}/${rede}_${loja}_status.log
/usr/bin/zip -qj ${locate}/${rede}_${loja}_playlist /srv/www/htdocs/xmms.m3u
/usr/bin/zip -qj ${locate}/${rede}_${loja}_radio ${locate}/radio.log

# Envia o arquivo de log para o server
verifica=`cat /usr/local/bin/radio-update.sh | grep ip= | cut -d '"' -f2 | cut -d "." -f4`
if [ "$verifica" -eq 226 ]
then
	# Apaga as informacoes de chaves de criptografia (known_hosts) do ssh
	/bin/rm -rf /root/.ssh

	# Chama o script em expect de transferencia dos arquivos de logs
	/usr/local/bin/transfere.exp $ip
else
	# Envia o arquivo recem criado para o server
	rsync -aq --timeout=180 --password-file=/etc/radio.update ${locate}/*.zip rsync://${rede}@${ip}:/${rede}_logs
fi

# Exclui os arquivos que estao no diretorio de log
rm -f ${locate}/*.zip
