#!/bin/bash

red=0
yellow=2
green=3

on=1
off=0

gpio mode $red out
gpio mode $yellow out
gpio mode $green out

input=0

read input

if [ $input = "0" ];
then
	gpio write $green $on
	gpio write $yellow $off
	gpio write $red $off
fi


if [ $input = "1" ];
then
	gpio write $green $off
	gpio write $red $off
	gpio write $yellow $on
	sleep 0.5
	gpio write $yellow $off
	gpio write $red $on
fi

if [ $input = "2" ];
then
	gpio write $red $on
	gpio write $green $off
	gpio write $yellow $on
	sleep 0.5
	gpio write $red $off
	gpio write $yellow $off
	gpio write $green $on
fi

