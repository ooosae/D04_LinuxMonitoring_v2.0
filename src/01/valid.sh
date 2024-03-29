#!/bin/bash

check_input() {
    if [ "$#" -ne 6 ]; then
        echo "Ошибка: неверное количество аргументов. Используйте 6 аргументов, соответствующих описанным параметрам" >&2
        exit 1
    fi

    if [ ! -d "$1" ]; then
        echo "Ошибка: '$1' не является абсолютным путем" >&2
        exit 1
    fi

    re='^[0-9]+$'
    if ! [[ $2 =~ $re ]] ; then
        echo "Ошибка: '$2' не является целым числом" >&2
        exit 1
    fi

    if ! [[ "$4" =~ $re ]] ; then
        echo "Ошибка: '$4' не является целым числом" >&2
        exit 1
    fi
    
    re='^[a-zA-Z]{1,7}$'
    if ! [[ $3 =~ $re ]] ; then
        echo "Ошибка: '$3' не является строкой, состоящей из букв английского алфавита и имеющей не более семи знаков" >&2
        exit 1
    fi


    re='^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$'
    if ! [[ $5 =~ $re ]] ; then
        echo "Ошибка: '$5' не является строкой, состоящей из букв английского алфавита и имеющей не более семи знаков для имени и не более трех знаков для расширения" >&2
        exit 1
    fi

    re='^[0-9]+kb$'
    if ! [[ "$6" =~ $re ]] || [ "${6%kb}" -gt 100 ]; then
        echo "Ошибка: '$6' не является целым числом, которое не превышает 100 и имеет единицу измерения 'kb'" >&2
        exit 1
    fi

}
