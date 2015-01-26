#!/bin/bash

# Script que remove excesso de arquivos de log, evitando lotar o hd da maquina com informacoes desnecessarias
# 2012-02-15

# Remove os logs mais antigos que 7 dias
find /var/log/radio/ -name "*.zip" -mtime +7 -exec rm {} \;
