#!/bin/bash

if [ $# != 0 ]
then
    echo "Ошибка: неверное количество аргументов." >&2
    exit 1
else
    echo "Введите путь к лог-файлу"
    LOG_FILE=0
    read LOG_FILE
    goaccess "$LOG_FILE" --log-format=COMBINED -o report.html
fi
