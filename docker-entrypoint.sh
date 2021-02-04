#!/bin/bash

echo '"Word", "Number of occurences"'

set -e
set +x

SPELLING_MISTAKES=$(find "$PATH_TO_CHECK" -type f -name "$EXT_TO_CHECK" -exec bash -c "aspell --lang=en --ignore=2 --encoding=utf-8 --word-list-path=/wordlists/all.txt list < {}" \;)
SPELLING_MISTAKES=$(echo "$SPELLING_MISTAKES" | aspell --lang=fr --ignore=2 --encoding=utf-8 --word-list-path=/wordlists/all.txt list)

echo "$SPELLING_MISTAKES" | sort | uniq -c | awk '{ printf "\"%s\", %s\n", $2, $1 }'
