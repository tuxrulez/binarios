#!/bin/bash
x=`ping tvdia.homelinux.com -c 3 | head -n 1 | cut -d "(" -f2 | cut -d " " -f1 | cut -d ")" -f1`
echo $x > /ti/scripts/retorno/ipdia.txt
