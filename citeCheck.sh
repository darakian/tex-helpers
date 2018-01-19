#!/bin/bash
#Little bash script to help find unused references
bibSource=$1
texSource=$2
if ( [ -z "$1" ] || [ -z "$2" ]); then
  echo "Usage: "$0" bibSource texSource"
  echo "Finds references in bibSource which are not used in texSource"
  exit
fi
tokens="$(grep @ "$bibSource" | sed 's/{/,/g' | awk -F, '{print $2}')"
for token in $tokens
do
  if $(grep -q "$token" "$texSource"); then
    continue
  else
    echo "$token"
  fi
done
