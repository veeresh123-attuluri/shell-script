#!/bin/bash

number1=$1
number2=$2

timestamp=$(date)
echo "script executed at : $timestamp"
sum=$(($number1+$number2))
echo "sum of $number1 and $number2 is : $sum"
