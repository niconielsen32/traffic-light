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

buttonClicked=false

waitButton()
{
	while [ `gpio read $button` = $on ]; do
		sleep 0.1
	done
}



# Loop forever until user presses Ctrl-C
while [ 1 ]
do	
	gpio write $green $on
	waitButton
	gpio write $green $off
	sleep 1

done
