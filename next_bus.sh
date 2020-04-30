#!/bin/sh
if [ $# -eq 0 ]
  then
  TIME=$(date +"%H%M")
  echo "No parameters, using current time: $(date +"%H:%M")"
elif [ $# -ge 2 ]
  then
  echo "next_bus.sh takes 0 or 1 parameters, you've provided ${#}"
  exit
else
  echo "Parameter detected, using $1"
  TIME=$(date -d $1 +"%H%M")
fi

while read f
do
  if [ $(date -d $f +"%H%M") -gt $TIME ]
    then
      echo "Next bus is at $f"
      exit 1
  fi
done < schedule

echo "There are no more buses today"
