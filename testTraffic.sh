#!/bin/bash

# Assign names to GPIO pin numbers for each light
red=0
yellow=2
green=3

button=5

# Assign names to states
on=1
off=0

gpio mode $red out
gpio mode $yellow out
gpio mode $green out

gpio mode $button in

gpio write $green $on
gpio write $yellow $off
gpio write $red $off


firstClick=false
secondClick=false

trafficState=false


# Loop forever until user presses Ctrl-C
while [ 1 ]
do

  # traffic light
if [[ `gpio read $button` = $on && $trafficState = false ]];
then
	firstClick=true
	echo "First Click"
	sleep 0.5
fi

if [[ `gpio read $button` = $on && $trafficState = true ]];
then
	secondClick=true
	echo "Second Click"
	sleep 0.5
fi



if [[ $firstClick = true ]];
then
	gpio write $green $off
	gpio write $red $off
	gpio write $yellow $on
	sleep 1

	gpio write $yellow $off
	gpio write $red $on
	sleep 1

	trafficState=true
	firstClick=false
fi

if [[ $secondClick = true ]];
then
	#second click
	gpio write $red $on
	gpio write $yellow $on
	sleep 1
	gpio write $red $off
	gpio write $yellow $off
	gpio write $green $on

	trafficState=false
	firstClick=false
	secondClick=false
fi

done
