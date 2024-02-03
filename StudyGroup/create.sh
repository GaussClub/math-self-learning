#!/bin/bash

year=$(date +%Y)
months=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12")

for month in "${months[@]}"; do
  days=$(cal "$month" "$year" | awk 'NF {DAYS = $NF}; END {print DAYS}')

  mkdir -p "./$month"
  
  for day in $(seq -w 1 "$days"); do
    mkdir -p "./$month/$day"
    touch "./$month/$day/.gitkeep"
  done
done
