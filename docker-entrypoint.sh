#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo "Provide a files/path to check for spelling mistakes. Usage: $0 [path to files/folder]"
  exit 1
fi

COMMON_ARGS=(--ignore 2 --encoding=utf-8 --word-list-path="/wordlists/all.txt")

echo '"Word", "Number of occurences"'

set -e
set -x

for f in $1 ; do 
  aspell --lang=en "${COMMON_ARGS[@]}" list < "$f" | aspell --lang=fr "${COMMON_ARGS[@]}" list | sort | uniq -c | awk '{ printf "\"%s\", %s\n", $2, $1 }'
done
