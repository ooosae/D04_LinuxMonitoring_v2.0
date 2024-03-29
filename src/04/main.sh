#!/bin/bash

function random_ip() {
    printf "%d.%d.%d.%d" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))"
}

response_codes=(
    "200" # OK
    "201" # CREATED
    "400" # BAD_REQUEST
    "401" # UNAUTHORIZED
    "403" # FORBIDDEN
    "404" # NOT_FOUND
    "500" # INTERNAL_SERVER_ERROR
    "501" # NOT_IMPLEMENTED
    "502" # BAD_GATEWAY
    "503" # SERVICE_UNAVAILABLE
    )

methods=("GET" "POST" "PUT" "PATCH" "DELETE")

urls=("/" "/login" "/logout" "/profile" "/register" "/api/data" "/api/info" "/private")

agents=(
    "Mozilla"
    "Google Chrome"
    "Opera"
    "Safari"
    "Internet Explorer"
    "Microsoft Edge"
    "Crawler and bot"
    "Library and net tool"
)

for day in {1..5}; do
    log_file="$day.log"
    touch "$log_file"
    num_records=$((RANDOM % 901 + 100))

    for ((record = 1; record <= num_records; record++)); do
        ip=$(random_ip)
        response_code=${response_codes[$((RANDOM % ${#response_codes[@]}))]} 
        method=${methods[$((RANDOM % ${#methods[@]}))]}
        url=${urls[$((RANDOM % ${#urls[@]}))]}
        timestamp=$(date -u -d "2023-04-$day $((RANDOM % 24)):$((RANDOM % 60)):$((RANDOM % 60))" +[%d/%b/%Y:%H:%M:%S\ %z])
        agent=${agents[$((RANDOM % ${#agents[@]}))]}

        echo "$ip - - $timestamp \"$method $url HTTP/1.1\" $response_code 512 \"$url\" \"$agent\"" >> "$log_file"
    done

    sort -k 4 -o "$log_file" "$log_file"

done


