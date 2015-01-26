#!/bin/bash

# Script que traz os IPS de todas as Redes
# Salustriano Bessa <salustriano@megamidia.com.br>
# 2010-01-07

clear
echo " "
echo " Selecione umas das opções abaixo para ter informações sobre os IPS " | sed ':a;s/^.\{1,78\}$/ & /;ta'
echo " "
echo -n "Selecione a Rede Desejada :
	1  - ABC 
	2  - Campeão 
	3  - CompreBem 
	4  - Condor 
	5  - Dia% 
	6  - Extra 
	7  - Giga 
	8  - Italo
	9  - Leader
	10 - Lojas Colombo
	11 - Makro
	12 - Pão de Açúcar
	13 - Sendas
	14 - Shopping
	*  - Sair
	Digite OPCAO [numeros]: " ; read con
case $con in 
        1) clear
           echo " "
           echo " Tabela de IPs da Rede ABC " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=1;" | mysql -t -u root ips
           exit 0
;;
        2) clear
           echo " "
           echo " Tabela de IPs da Rede Campeão " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=2;" | mysql -t -u root ips
           exit 0
;;
        3) clear
           echo " "
           echo " Tabela de IPs da Rede CompreBem " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=3;" | mysql -t -u root ips
           exit 0
;;
	4) clear
	   echo " "
	   echo " Tabela de IPs da Rede Condor " | sed ':a;s/^.\{1,78\}$/ & /;ta'
	   echo " "
	   echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=4;" | mysql -t -u root ips
	   exit 0
;;
        5) clear
           echo " "
           echo " Tabela de IPs da Rede Dia% " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=5;" | mysql -t -u root ips
           exit 0
;;
        6) clear
           echo " "
           echo " Tabela de IPs da Rede Extra " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=6;" | mysql -t -u root ips
           exit 0
;;
        7) clear
           echo " "
           echo " Tabela de IPs da Rede Giga " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=7;" | mysql -t -u root ips
           exit 0
;;
        8) clear
           echo " "
           echo " Tabela de IPs da Rede Italo " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=8;" | mysql -t -u root ips
           exit 0
;;
        9) clear
           echo " "
           echo " Tabela de IPs da Rede Leader " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=9;" | mysql -t -u root ips
           exit 0
;;
        10) clear
           echo " "
           echo " Tabela de IPs da Rede Colombo (Rádio) " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=10;" | mysql -t -u root ips
           exit 0
;;
        11) clear
           echo " "
           echo " Tabela de IPs da Rede Makro " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=11;" | mysql -t -u root ips
           exit 0
;;
        12) clear
           echo " "
           echo " Tabela de IPs da Rede Pão de Açúcar " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=12;" | mysql -t -u root ips
           exit 0
;;
        13) clear
           echo " "
           echo " Tabela de IPs da Rede Sendas " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=13;" | mysql -t -u root ips
           exit 0
;;
        14) clear
           echo " "
           echo " Tabela de IPs da Rede Shopping " | sed ':a;s/^.\{1,78\}$/ & /;ta'
           echo " "
           echo "select t1.loja, t2.datacenter, t2.servidor_hora, t2.ip_da_cpu, t2.mascara_de_rede, t2.ip_do_gateway, t2.endereco_de_rede, t2.broadcast, t2.hostname, t2.horario_de_atualizacao from lojas as t1, ipradio as t2 where t1.idloja = t2.lojas_idloja and t2.redes_idrede=14;" | mysql -t -u root ips
           exit 0
;;
	*) echo "Saindo"
	exit 0
;;
esac
