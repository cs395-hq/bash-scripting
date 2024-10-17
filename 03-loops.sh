#!/usr/bin/env bash
# Looping: until, while, for

echo "Looping using until"
a=1
until [ $a -eq 4 ]; do
  printf "%d " $a # c-style printing
  a=$((a+1)) # Another way of doing: a=$[$a + 1]
  if [ $a -eq 3 ]; then
    break # exit the loop
  fi
done

echo && echo "Looping using while"
a=0
while [ $a -lt 4 ]; do
  a=$((a+1))
  if [ $a -eq 2 ]; then
    continue # jump to the next iteration, don't run the following
  fi
  printf "%d " $a
done

echo && echo "Looping using for"
for i in 1 2 3; do # or use {1..3} or $(seq 1 3)
  printf "%d " $i
done
echo 

