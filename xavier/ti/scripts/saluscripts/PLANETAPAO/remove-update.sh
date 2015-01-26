
#!/bin/bash

ls | grep -v adiciona-update.sh | grep -v remove-update.sh | while read arquivo 
do
        ls ../ | grep -v ^000 | while read loja
	do
        	unlink ../$loja/$arquivo 2> /dev/null
		rm -f $arquivo
	done
done
