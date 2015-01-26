#!/bin/bash

# POR FAVOR NAO SABE NAO SE METE, PROCURE ALGUEM QUE SAIBA - PORRA
# 2012-03-05


# Sincronismo de scripts adicionado na pasta relativa. Porem nao ativa sua execucao

executa=1

update="update201203051600"

ls /etc/*release* | grep -i mandrake

if [ $? -eq 0 ]
then
	if [ ! -d /tmp/${update} -a $executa -eq 1 ]
	then
       		cp /usr/local/scripts/sincroniza-scripts.sh /etc/cron.daily/sincroniza-scripts.sh 
	        chmod +x /etc/cron.daily/sincroniza-scripts.sh
		mkdir /tmp/${update}
	fi
else
	if [ ! -d /tmp/${update} -a $executa -eq 1 ]
	then
       		cp /usr/local/scripts/sincroniza-scripts.sh /usr/local/bin/sincroniza-scripts.sh 
	        chmod +x /usr/local/bin/sincroniza-scripts.sh
		mkdir /tmp/${update}
	fi
fi

executa=0

# Procedimento para INCLUSAO de bancos musicais.

executa=1

update="update201203051650"

if [ ! -d /tmp/${update} -a $executa -eq 1 ]
then
	verifica=`ls /usr/local/radio/generos/musical/ | grep PaoMusicTop2008`
	if [ "$verifica" == "" ]
	then
		mkdir /usr/local/radio/generos/musical/PaoMusicTop2008
		cp -a /usr/local/scripts/PaoMusicTop2008/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_1/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_2/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_3/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_4/* /usr/local/radio/generos/musical/PaoMusicTop2008/
	else
		cp -a /usr/local/scripts/PaoMusicTop2008/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_1/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_2/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_3/* /usr/local/radio/generos/musical/PaoMusicTop2008/
		cp -a /usr/local/scripts/PaoMusicTop2008_4/* /usr/local/radio/generos/musical/PaoMusicTop2008/
	fi
	verifica=`ls /usr/local/radio/generos/musical/ | grep PaoMusicTop2010`
	if [ "$verifica" == "" ]
	then
		mkdir /usr/local/radio/generos/musical/PaoMusicTop2010
		cp -a /usr/local/scripts/PaoMusicTop2010/* /usr/local/radio/generos/musical/PaoMusicTop2010/
		cp -a /usr/local/scripts/PaoMusicTop2010_1/* /usr/local/radio/generos/musical/PaoMusicTop2010/
		cp -a /usr/local/scripts/PaoMusicTop2010_2/* /usr/local/radio/generos/musical/PaoMusicTop2010/
	else
		cp -a /usr/local/scripts/PaoMusicTop2010/* /usr/local/radio/generos/musical/PaoMusicTop2010/
		cp -a /usr/local/scripts/PaoMusicTop2010_1/* /usr/local/radio/generos/musical/PaoMusicTop2010/
		cp -a /usr/local/scripts/PaoMusicTop2010_2/* /usr/local/radio/generos/musical/PaoMusicTop2010/
	fi
fi

executa=0


# Procedimento para limpar os Logs.

executa=1

update="update201203051610"

ls /etc/*release* | grep -i mandrake

if [ $? -eq 0 ]
then
	if [ ! -d /tmp/${update} -a $executa -eq 1 ]
	then
		rm -f /etc/cron.daily/logmon.sh
		rm -f /usr/local/etc/logmon.sh
		rm -f /usr/local/bin/logmon.sh
		rm -f /etc/cron.daily/transfere.exp
		rm -f /usr/local/etc/transfere.exp
		rm -f /usr/local/bin/transfere.exp
		rm -f /etc/cron.daily/limpa-log.sh
		rm -f /usr/local/etc/limpa-log.sh
		rm -f /usr/local/bin/limpa-log.sh
		rm -f /etc/cron.daily/log-status.sh
		rm -f /usr/local/etc/log-status.sh
		rm -f /usr/local/bin/log-status.sh
		rm -f /var/www/html/zi*
		rm -f /var/log/radio/zi*
		rm -f /var/log/radio/*.zip
		rm -f /var/www/html/radio.sql
		rm -f /var/www/html/radio.zip
		cp /usr/local/scripts/limpa-log.sh /etc/cron.daily/limpa-log.sh
		chown root.root /etc/cron.daily/limpa-log.sh
		chmod +x /etc/cron.daily/limpa-log.sh
		cp /usr/local/scripts/transfere.exp /etc/cron.daily/transfere.exp
		chown root.root /etc/cron.daily/transfere.exp
		chmod +x /etc/cron.daily/transfere.exp
		cp /etc/cron.daily/transfere.exp /usr/local/etc/
		cp /usr/local/scripts/status-maquinamdk.sh /etc/cron.daily/status-maquina.sh
		chown root.root /etc/cron.daily/status-maquina.sh
		chmod +x /etc/cron.daily/status-maquina.sh
		cp /usr/local/scripts/log-statusmdk.sh /etc/cron.daily/log-status.sh
		chown root.root /etc/cron.daily/log-status.sh
		chmod +x /etc/cron.daily/log-status.sh
		cp /usr/local/scripts/musical.sh /etc/cron.daily/musical.sh
		chown root.root /etc/cron.daily/musical.sh
		chmod +x /etc/cron.daily/musical.sh
		/etc/cron.daily/musical.sh
		mkdir /tmp/${update}
	fi
else
	if [ ! -d /tmp/${update} -a $executa -eq 1 ]
	then
		rm -f /usr/local/bin/logmon.sh
		rm -f /usr/local/etc/logmon.sh
		rm -f /usr/local/bin/limpa-log.sh
		rm -f /usr/local/etc/limpa-log.sh
		rm -f /usr/local/bin/transfere.exp
		rm -f /usr/local/etc/transfere.exp
		rm -f /usr/local/bin/log-status.sh
		rm -f /var/lib/mysql/mysql-bin.*
		rm -f /srv/www/htdocs/zi*
		rm -f /var/log/radio/zi*
		rm -f /var/log/radio/*.zip
		rm -f /srv/www/htdocs/radio.sql
		rm -f /srv/www/htdocs/radio.zip
		cp /usr/local/scripts/limpa-log.sh /usr/local/bin/limpa-log.sh
		chown root.root /usr/local/bin/limpa-log.sh
		chmod +x /usr/local/bin/limpa-log.sh
		cp /usr/local/scripts/transfere.exp /usr/local/bin/transfere.exp
		chown root.root /usr/local/bin/transfere.exp
		chmod +x /usr/local/bin/transfere.exp
		cp /usr/local/bin/transfere.exp /usr/local/etc
		cat /proc/version | cut -d " " -f3 > /tmp/versao.txt
		teste=`cat /tmp/versao.txt | grep 2.6.3`
		if [ "$teste" != "" ]
		then
			cp /usr/local/scripts/status-maquinasemporta.sh /usr/local/bin/status-maquina.sh
			chown root.root /usr/local/bin/status-maquina.sh
			chmod +x /usr/local/bin/status-maquina.sh
			cp /usr/local/scripts/log-statussemporta.sh /usr/local/bin/log-status.sh
			chown root.root /usr/local/bin/log-status.sh
			chmod +x /usr/local/bin/log-status.sh
			cp /usr/local/scripts/musical.sh /usr/local/bin/musical.sh
			chown root.root /usr/local/bin/musical.sh
			chmod +x /usr/local/bin/musical.sh
			/usr/local/bin/musical.sh
		else
			cp /usr/local/scripts/status-maquina.sh /usr/local/bin/status-maquina.sh
			chown root.root /usr/local/bin/status-maquina.sh
			chmod +x /usr/local/bin/status-maquina.sh
			cp /usr/local/scripts/log-status.sh /usr/local/bin/log-status.sh
			chown root.root /usr/local/bin/log-status.sh
			chmod +x /usr/local/bin/log-status.sh
			cp /usr/local/scripts/musical.sh /usr/local/bin/musical.sh
			chown root.root /usr/local/bin/musical.sh
			chmod +x /usr/local/bin/musical.sh
			/usr/local/bin/musical.sh
		fi
		mkdir /tmp/${update}
	fi
fi

executa=0


# Procedimento para alteracao do Crontab.

executa=1

update="update201203051620"

ls /etc/*release* | grep -i mandrake

if [ $? -eq 0 ]
then
	if [ ! -d /tmp/${update} -a $executa -eq 1 ]
	then
		> /etc/crontab
		cp /usr/local/scripts/crontabmdk /etc/crontab
		chown root.root /etc/crontab
		chmod 644 /etc/crontab
		mkdir /tmp/${update}
	fi
else
	if [ ! -d /tmp/${update} -a $executa -eq 1 ]
	then
		> /etc/crontab
		cp /usr/local/scripts/crontab /etc/crontab
		chown root.root /etc/crontab
		chmod 644 /etc/crontab
		mkdir /tmp/${update}
	fi
fi

executa=0


# Procedimento para CORRECAO da data fim de musicas no MySQL.

executa=1

update="update201101021330"

if [ ! -d /tmp/${update} -a $executa -eq 1 ]
then
	echo "alter table arquivos change data_fim data_fim date not null default '2038-12-31';" | mysql -u root radio
	echo "update arquivos set data_fim='2038-12-31' where tipo='musical';" | mysql -u root radio
	killall X
	mkdir /tmp/${update}
fi

executa=0


# Procedimento para EXCLUSAO de musicas.

executa=1

update="update201202151740"

if [ ! -d /tmp/${update} -a $executa -eq 1 ]
then
	cp /usr/local/scripts/lista.txt /tmp/lista.txt
	cat /tmp/lista.txt | while read arquivo
	do
		find /usr/local/radio/generos/musical/ -iname "*${arquivo}*" -exec rm -f {} \;
		echo "delete from arquivos where arquivo like '%${arquivo}%' and tipo='musical';" | mysql -u root radio
	done
	mkdir /tmp/${update}
fi

executa=0

executa=1

update="update201203173900"

ls /etc/*release* | grep -i mandrake

if [ $? -eq 0 ]
then
        if [ ! -d /tmp/${update} -a $executa -eq 1 ]
        then
                cp /usr/local/scripts/MDKPLA* /etc/cron.daily/
                chmod +x /etc/cron.daily/MDKPLA*
		cat /usr/local/scripts/crontabmdk > /etc/crontab
		/etc/init.d/crond restart
                mkdir /tmp/${update}
        fi
else
        if [ ! -d /tmp/${update} -a $executa -eq 1 ]
        then
		cp /usr/local/scripts/PLANE* /usr/local/bin/
                chmod +x /usr/local/bin/PLANE*
                cat /usr/local/scripts/crontab > /etc/crontab
                /etc/init.d/cron restart
                mkdir /tmp/${update}
        fi
fi

executa=0

