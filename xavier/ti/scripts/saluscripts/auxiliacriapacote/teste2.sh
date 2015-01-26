#!/bin/bash

for i in `cat /home/saluscripts/auxiliacriapacote/logs.txt `;
do zcat $i | grep .mp4 | grep .mp4 | cut -d "_" -f2
if [ $? -eq 0 ];then
        echo "$i" > /tmp/testao.txt ;
fi;
done

