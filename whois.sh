#!/bin/bash
#Сохранение html страницы с  сайта whois.com
#Проблемы- 1)чтение файла(в конце нужен перенос строки для работы)

if [[ "$#" != 3 ]]; then
echo "No parameters found. "; else

    resdir=$1
    case=$2
    url=$3
    filename="domains.txt"


    mkdir -p $resdir


    if [[ "$case" = "domain" ]]; then

        urls="${url##*/}"
        urls="${urls#$'www.'}"
        curl -o $resdir/${urls//["."]/_}.html https://www.whois.com/whois/$urls

    elif [[ "$case" = "file" ]]; then

        cat $filename | while read line; do

            urls="${line%$'\r'}"
            urls="${urls##*/}"
            urls="${urls#$'www.'}"
            curl -o $resdir/${urls//["."]/_}.html https://www.whois.com/whois/$urls; done

    fi
fi