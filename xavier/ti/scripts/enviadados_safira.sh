#!/bin/bash

# Script que verifica as lojas existentes em cada rede e monta um arquivo para ser comparado com as lojas da pagina de logs do safira
# Salustriano Bessa <salusbessa@yahoo.com.br>
# 2011-04-08

path_registro="/ti/scripts/saluscripts/safira"
path_origem="/mnt/hd500/sistema/"


#ls ${path_origem}/radio/ABC/sql/ | grep Lj > ${path_registro}/ABC/ABC.txt

#ls ${path_origem}/radio/Armazem/sql/ | grep -v '^000' | grep -v 'AProgramacao' > ${path_registro}/Armazem/Armazem.txt

#ls ${path_origem}/radio/Campeao/sql/ | grep Lj > ${path_registro}/Campeao/Campeao.txt

ls ${path_origem}/radio/Centauro_Esportes/sql/ | grep CE > ${path_registro}/Centauro_Esportes/Centauro_Esportes.txt

#ls ${path_origem}/radio/Comercial_Carvalho/sql/ | grep -v '^000' | grep -v 'APrograma' > ${path_registro}/Comercial_Carvalho/Comercial_Carvalho.txt

#ls ${path_origem}/radio/Comprebem/sql/ | grep -v '^000' | grep -v 'A' | grep -v 'Diretoria' | grep -v 'Escritorio_SP' | grep -v 'Teste' > ${path_registro}/Comprebem/Comprebem.txt

ls ${path_origem}/radio/Condor/sql/ | grep -v '000' | grep -v 'AA' > ${path_registro}/Condor/Condor.txt

ls ${path_origem}/radio/Dia_Sup/sql/ | grep -v '^000' | grep -v 'AAAteste' | grep -v 'AProgramacao' | grep -v 'ATeste' | grep -v '^Escola' > ${path_registro}/Dia_Sup/Dia_Sup.txt

ls ${path_origem}/radio/Extra/sql/ | grep Lj > ${path_registro}/Extra/Extra.txt

ls ${path_origem}/radio/Extra_Facil/sql/ | grep Lj > ${path_registro}/Extra_Facil/Extra_Facil.txt

ls ${path_origem}/radio/GBarbosa/sql/ | grep -v '^000' | grep -v 'AAProgramacao' > ${path_registro}/GBarbosa/GBarbosa.txt

#ls ${path_origem}/radio/Grupo_EB/sql/ | grep Lj > ${path_registro}/Grupo_EB/Grupo_EB.txt

#ls ${path_origem}/radio/Makro/sql/ | grep Lj > ${path_registro}/Makro/Makro.txt

#ls ${path_origem}/radio/MegaBox/sql/ | grep Lj > ${path_registro}/MegaBox/MegaBox.txt

ls ${path_origem}/radio/Muffato/sql/ | grep -v '^000' | grep -v 'Aprogramacao' > ${path_registro}/Muffato/Muffato.txt

ls ${path_origem}/radio/Pao_de_Acucar/sql/ | grep -v '^000' | grep -v 'AProgramacao' > ${path_registro}/Pao_de_Acucar/Pao_de_Acucar.txt

ls ${path_origem}/radio/Perini/sql/ | grep Lj > ${path_registro}/Perini/Perini.txt

#ls ${path_origem}/radio/Sendas/sql/ | grep Lj > ${path_registro}/Sendas/Sendas.txt

ls ${path_origem}/radio/Shopping/sql/ | grep Iguatemi_Fortaleza > ${path_registro}/Shopping/Shopping.txt

#ls ${path_origem}/radio/Shopping/sql/ | grep Total_Porto_Alegre >> ${path_registro}/Shopping/Shopping.txt

ls ${path_origem}/radio/Subway/sql/ | grep -v '000' | grep -v 'AProgramacao' | grep -v 'Teste' > ${path_registro}/Subway/Subway.txt

ls ${path_origem}/radio/Zaffari/sql/ | grep Lj > ${path_registro}/Zaffari/Zaffari.txt

#ls ${path_origem}/tv/AATeste_TV/sql/ | grep -v '^000' | grep -v 'AAProgramacao' | grep -v 'Lj_00' > ${path_registro}/AATeste_TV/AATeste_TV.txt

#ls ${path_origem}/tv/Armazem_Paraiba_TV/sql/ | grep -v '^000' | grep -v 'AAProgramacao' | grep -v 'AA_VitrineVirtual' > ${path_registro}/Armazem_Paraiba_TV/Armazem_Paraiba_TV.txt

#ls ${path_origem}/tv/Berlanda_TV/sql/ | grep -v '^000' | grep -v 'AAProgramacao' | grep -v 'AAVitrineVirtual' > ${path_registro}/Berlanda_TV/Berlanda_TV.txt
#
#ls ${path_origem}/tv/Condor_TV/sql/ | grep -v '^000' | grep -v 'AAProgramacao' | grep -v 'AA_0001' > ${path_registro}/Condor_TV/Condor_TV.txt

#ls ${path_origem}/tv/Eletrosom_TV/sql/ | grep -v '^000' | grep -v 'AAProgramacao' | grep -v 'AA_Teste' | grep -v 'AAVitrineVirtual' | grep -v 'A_SKY' | grep -v 'ZZ_9999' > ${path_registro}/Eletrosom_TV/Eletrosom_TV.txt

#ls ${path_origem}/tv/GBarbosa_FT/sql/ | grep -v 'AAProgramacao' > ${path_registro}/GBarbosa_FT/GBarbosa_FT.txt

ls ${path_origem}/tv/GBarbosa_TV/sql/ | grep -v '^000' | grep -v 'DRH' | grep -v 'Progra' | grep -v 'AA_0002' | grep -v 'Teste' | grep -v 'Vitrine' | grep -v 'Z' > ${path_registro}/GBarbosa_TV/GBarbosa_TV.txt

#ls ${path_origem}/tv/Lojas_Colombo_TV/sql/ | grep -v '^000' | grep -v 'AA_0001' | grep -v 'AAA' | grep -v 'Pro' > ${path_registro}/Lojas_Colombo_TV/Lojas_Colombo_TV.txt

#ls ${path_origem}/tv/Makro_TV/sql/ | grep -v '^000' | grep -v 'AA' | grep -v 'ZZ' > ${path_registro}/Makro_TV/Makro_TV.txt

#ls ${path_origem}/tv/Muffato_TV/sql/ | grep -v '^000' | grep -v 'AAProgramacao' | grep -v 'AAVitrineVirtual' | grep -v 'AA_0001' > ${path_registro}/Muffato_TV/Muffato_TV.txt
#
#ls ${path_origem}/tv/Pao_Elevadores/sql/ | grep -v '^000' | grep -v 'A' | grep -v 'Lorena_Auditorio' | grep -v 'Lorena_Beija_Flor' > ${path_registro}/Pao_Elevadores/Pao_Elevadores.txt
