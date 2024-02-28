#!/bin/bash

find *$1*
awk '{print $1, $2}' $1_Dealer_schedule | grep "$2 $3"
grep -o *$2* $1_Dealer_schedule | awk '{print $1, $2}'
awk '{print $2}' $1_Dealer_schedule | grep -o *$3*
grep "$2 $3" $1_Dealer_schedule | awk '{print $5, $6}'
