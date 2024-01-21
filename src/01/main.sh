#!/bin/bash

export current_date=$(date +%d%m%y)
export FREE_SPACE=$(df -k / | awk '{print $4}' | tail -n 1)
export LOG_FILE="1.log"

. ./process.sh
. ./valid.sh

check_input "$1" "$2" "$3" "$4" "$5" "$6"
run "$1" "$2" "$3" "$4" "$5" "$6"
column -t $LOG_FILE > temp_file.txt && mv temp_file.txt $LOG_FILE
