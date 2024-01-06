#!/bin/bash

TARGET_SRT="${TARGET_SRT:-}"

for f in "${TARGET_SRT}" ; do 
    echo $f
    aspell list --lang=nl < $f | sort | uniq -c
done

echo "Correcting now"

for file in "${TARGET_SRT}"; do
    aspell --master=nl --lang=nl -c "$file" < /dev/null
done

while true; do
    sleep 1
done
