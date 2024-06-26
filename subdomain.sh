#!/bin/bash
# passo a passo: 
# 1° com a ferramenta wget + url, baixará todo o html da página e salvará como "index.html"
# 2° com os delimitadores "grep" e "cut" iremos fazer um filtro  do arquivo index.html para nos retornar somente os subdominios, depois direcionar para um arquivo especifico
# 3° com o arquivo especifico salvo iremos fazer uma pesquisa co a ferramenta "host" em todos os domnios salvos.
echo " ==================================================================================="
echo " =                                                                                 ="
echo " =                                                                                 ="
echo " =              +ESCANEANDO+HOST == $1                                             ="
echo " =                                                                                 ="
echo " =                                                                                 ="
echo " ==================================================================================="
pasta="$1"
if [ $1 == "" ]
then 
	echo "Parameter not found"
	echo "Ex: $0 + url "
else 
	wget $1 && mkdir $1 && mv index.html $1 && cd $pasta
fi

echo "_____________________________________________________________________________________"

	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > lista

echo "--------------------------------------------------------------------------------------"

	for url in $(cat lista);do host $url | grep "has address"; > lista2;done

