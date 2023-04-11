#!/usr/bin/env bash

counter=0

while :
do
    counter=$((counter+1))
    tput cup 0 0
    # clear
    lolcat $1 -S $counter -f
    # sleep .1
done
