#! /bin/bash

total=$(cut -d '"' -f2,3 $2 | sed 's/GET//' | cut -d ' ' -f2,4 | awk '$2 ~ /^4/ {print}' | cut -d ' ' -f1 | sort | uniq -c | sort -r -n | head -$1 | awk '{sum+=$1} END {print sum}')
res=$(cut -d '"' -f2,3 $2 | sed 's/GET//' | cut -d ' ' -f2,4 | awk '$2 ~ /^4/ {print}' | cut -d ' ' -f1 | sort | uniq -c | sort -r -n | head -$1 | awk '{ printf(NR ". %s - %d - %.1f%%\n", $2, $1, $1 / '"$total"' * 100 ) }')

echo "$res"