#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo "Provide a files/path to check for spelling mistakes. Usage: $0 [path to files/folder]"
  exit 1
fi

set -e
set -x

for f in $1 ; do aspell --lang=en --encoding=utf-8 list < $f | aspell --lang=fr --encoding=utf-8 list | sort | uniq -c ; done
