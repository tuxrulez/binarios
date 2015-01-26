#!/bin/bash
#
# Roteamentos Megamidia

# Configurarcoes gerais
IPT="/sbin/iptables"
ROUTE="/sbin/route"
IP="/sbin/ip"
RMOD="/sbin/rmmod"
MOD="/sbin/modprobe"

# Redes
WAN="0/0"
LAN_INTERNA="10.0.0.0/8"
LAN_EXTERNA="200.195.168.0/28"

VPN_GB_LADO_MM="172.28.183.225"
VPN_AG_LADO_MM2="172.16.37.1"
VPN_GB_LADO_GB="172.28.184.5"
VPN_AG_LADO_AG="192.168.0.252"

start(){
	# Define rota com a GBarbosa
	$ROUTE add -host $VPN_GB_LADO_GB gw $VPN_GB_LADO_MM
	$ROUTE add -host $VPN_AG_LADO_AG gw $VPN_AG_LADO_MM2
	$ROUTE add -net 192.168.0.0/24 gw $VPN_AG_LADO_MM2
#	$ROUTE add -host 200.215.220.226 gw $VPN_AG_LADO_MM2
}

stop(){
	$ROUTE del -host $VPN_GB_LADO_GB gw $VPN_GB_LADO_MM
	$ROUTE del -host $VPN_AG_LADO_AG gw $VPN_AG_LADO_MM2
	$ROUTE del -net 192.168.0.0/24 gw $VPN_AG_LADO_MM2
}

case "$1" in
  start)
	echo -n "INICIANDO ROTEAMENTOS... "
	start
	echo "ok"
  ;;	

  stop)
	echo -n "PARANDO ROTEAMENTOS... "
	stop
	echo "ok"
  ;;

  status)
        echo "*************** TABELA DE ROTEAMENTOS ***************"
	$ROUTE -n
  ;;

  restart)
	echo -n "REINICIALIZANDO ROTEAMENTOS... "
  	stop
	start
	echo "OK"
  ;;

  *)
	echo $"USE: $0 { start | stop | restart | status }"
	exit 1
esac

exit 0
