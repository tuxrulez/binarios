#!/bin/bash

# Script que cadastra as lojas no banco
# Salustriano Bessa <salustriano@megamidia.com.br>
# 2010-01-06


cat ABC.txt | while read loja
do
    echo "insert into lojas values ('','$loja',1);" | mysql -u root ips
done

cat Campeao.txt | while read loja
do
    echo "insert into lojas values ('','$loja',2);" | mysql -u root ips
done

cat Comprebem.txt | while read loja
do
    echo "insert into lojas values ('','$loja',3);" | mysql -u root ips
done

cat Condor.txt | while read loja
do
    echo "insert into lojas values ('','$loja',4);" | mysql -u root ips
done

cat Dia_Sup.txt | while read loja
do
    echo "insert into lojas values ('','$loja',5);" | mysql -u root ips
done

cat Extra.txt | while read loja
do
    echo "insert into lojas values ('','$loja',6);" | mysql -u root ips
done

cat Giga.txt | while read loja
do
    echo "insert into lojas values ('','$loja',7);" | mysql -u root ips
done

cat ITALO_SUP.txt | while read loja
do
    echo "insert into lojas values ('','$loja',8);" | mysql -u root ips
done

cat Leader.txt | while read loja
do
    echo "insert into lojas values ('','$loja',9);" | mysql -u root ips
done

cat Lojas_Colombo.txt | while read loja
do
    echo "insert into lojas values ('','$loja',10);" | mysql -u root ips
done

cat Makro.txt | while read loja
do
    echo "insert into lojas values ('','$loja',11);" | mysql -u root ips
done

cat Pao_de_Acucar.txt | while read loja
do
    echo "insert into lojas values ('','$loja',12);" | mysql -u root ips
done

cat Sendas.txt | while read loja
do
    echo "insert into lojas values ('','$loja',13);" | mysql -u root ips
done

cat Shopping.txt | while read loja
do
    echo "insert into lojas values ('','$loja',14);" | mysql -u root ips
done

