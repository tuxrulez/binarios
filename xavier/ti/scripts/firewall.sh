#!/bin/bash
#
# Firewall Megamidia

# Configurarcoes gerais
IPT6="/sbin/ip6tables"
IPT="/sbin/iptables"
ROUTE="/sbin/route"
IP="/sbin/ip"
RMOD="/sbin/rmmod"
MOD="/sbin/modprobe"

# Redes
WAN="0/0"
LAN_INTERNA="10.0.0.0/8"
LAN_EXTERNA="10.0.0.0/8"
VPN_GB="172.28.183.224/29"
VPN_AG="192.168.0.0/24"

VPN_GB_LADO_MM="172.28.183.225"
VPN_AG_LADO_MM2="172.16.37.1"
VPN_GB_LADO_GB="172.28.184.5"
VPN_AG_LADO_AG="192.168.0.0/24"

# PORTAS
SSH=`cat /etc/ssh/sshd_config | grep "Port" | cut -d " " -f2`
RSYNC="873"

# ARQUIVOS
CLIENTES=`cat /ti/scripts/fw_arquivos/clientes.txt | cut -d "," -f1`

start(){
	stop

        $MOD ip6_tables

	# Define politicas padrao
        $IPT -P INPUT DROP
        $IPT -P FORWARD DROP
	$IPT -P OUTPUT ACCEPT

        $IPT6 -P INPUT DROP
        $IPT6 -P OUTPUT DROP
        $IPT6 -P FORWARD DROP

        # Garante acesso primario
	$IPT -A INPUT -i lo -j ACCEPT
	$IPT -A INPUT -s $LAN_INTERNA -j ACCEPT
	$IPT -A INPUT -s $LAN_EXTERNA -j ACCEPT
	$IPT -A INPUT -s $VPN_GB -j ACCEPT
	$IPT -A INPUT -s $VPN_AG -j ACCEPT

	# Conexoes estabelecidas e/ou relacionadas
        $IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	## Descomentar as duas linhas abaixo libera o PING ao 200.195.168.2
	iptables -A INPUT -p icmp --icmp-type 8 -s 0/0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
	iptables -A OUTPUT -p icmp --icmp-type 0 -d 0/0 -m state --state ESTABLISHED,RELATED -j ACCEPT
        
	# Liberar consultas DNS e NTP
        for PORTAS_CONSULT in 53 123;
        do
                $IPT -A INPUT -p tcp --sport $PORTAS_CONSULT -j ACCEPT
                $IPT -A INPUT -p tcp --dport $PORTAS_CONSULT -j ACCEPT
                $IPT -A INPUT -p udp --sport $PORTAS_CONSULT -j ACCEPT
                $IPT -A INPUT -p udp --dport $PORTAS_CONSULT -j ACCEPT
	done
        
	$IPT -A INPUT -p tcp -s $WAN --dport 873 -j ACCEPT	
	$IPT -A INPUT -p tcp -s $WAN --dport 5000 -j ACCEPT	

	# Libera portas para clientes
	for CLIENTES_IN in $CLIENTES;
	do
		for PORTAS in $SSH;
		do
		        $IPT -A INPUT -p tcp -s $CLIENTES_IN --dport $PORTAS -j ACCEPT
		        $IPT -A FORWARD -p tcp -s $CLIENTES_IN --dport $PORTAS -j ACCEPT
		done
	done

        # Bloqueia Samba de fora
        for SMB in 137 138 139
        do
                $IPT -A INPUT -p tcp -i $WAN --syn --dport $SMB -j DROP
        done

	# Conexoes estabelecidas e/ou relacionadas
	$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

        # Prioriza saida
        $IPT -t mangle -A OUTPUT -o eth0 -p tcp -m multiport --dports $SSH,$RSYNC,5000 -j TOS --set-tos 0x10
}

stop(){
	# Apagar cadeias definidas por usuarios
	$IPT -X -t filter
	$IPT -X -t nat
	$IPT -X -t mangle

	# Limpar Regras
	$IPT -F -t filter
	$IPT -F -t nat
	$IPT -F -t mangle

	# Definir politica default para ACCEPT
	$IPT -P INPUT ACCEPT
	$IPT -P OUTPUT ACCEPT
	$IPT -P FORWARD ACCEPT

	$IPT -t nat -P PREROUTING ACCEPT
	$IPT -t nat -P POSTROUTING ACCEPT
	$IPT -t nat -P OUTPUT ACCEPT

	$IPT -t mangle -P PREROUTING ACCEPT
	$IPT -t mangle -P POSTROUTING ACCEPT
	$IPT -t mangle -P INPUT ACCEPT
	$IPT -t mangle -P FORWARD ACCEPT
	$IPT -t mangle -P OUTPUT ACCEPT
}

case "$1" in
  start)
	echo -n "INICIANDO FIREWALL... "
	start
	echo "ok"
  ;;	

  stop)
	echo -n "PARANDO FIREWALL... "
	stop
	echo "ok"
  ;;

  status)
        echo "*************** KERNEL CONFS ***************"
	echo -n "IP FORWARD = "
        cat /proc/sys/net/ipv4/ip_forward
	echo -n "IP DYNADDR = "
	cat /proc/sys/net/ipv4/ip_dynaddr
	echo "ACCEPT REDIRECTS = "
	cat /proc/sys/net/ipv4/conf/*/accept_redirects
	echo "SEND REDIRECTS = "
	cat /proc/sys/net/ipv4/conf/*/accept_redirects
        echo "*************** TABELA FILTER ***************"
        $IPT -L
        echo "*************** TABELA NAT ***************"
        $IPT -t nat -L
        echo "*************** TABELA MANGLE ***************"
        $IPT -t mangle -L
  ;;

  restart)
	echo "REINICIALIZANDO FIREWALL... "
  	stop
	start
	echo "OK"
  ;;

  *)
	echo $"USE: $0 {start | stop | restart | status}"
	exit 1
esac

exit 0
