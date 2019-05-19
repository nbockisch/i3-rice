#!/usr/bin/bash

# Modified from the Lemonbar examples on the Arch Wiki

# Define the volume
Volume() {
	VOLPERC=$(amixer sget Master | grep 'Mono:' | awk -F '[][]' '{ print $2}' | grep -o '[0-9]*')

	if [ "$VOLPERC" -le "0" ]; then
        	echo " MUTE"
	elif [ "$VOLPERC" -le "50" ]; then
		echo " $VOLPERC%"
	elif [ "$VOLPERC" -le "100" ]; then
		echo " $VOLPERC%"
	fi
}

# Define the date
Clock() {
	DATETIME=$(date "+%R")

	echo -n "$DATETIME"
}

# Define the battery
Battery() {
	BATCHARGE=$(acpi | grep Discharging)        
	BATPERC=$(acpi --battery | cut -d, -f2 | grep -o '[0-9]*')
	
	if [ "$BATCHARGE" == "" ]; then
		echo " $BATPERC%"	
	elif [ "$BATPERC" -le "20" ]; then
        	echo " $BATPERC%"
	elif [ "$BATPERC" -le "40" ]; then
		echo " $BATPERC%"
	elif [ "$BATPERC" -le "60" ]; then
		echo " $BATPERC%"
	elif [ "$BATPERC" -le "80" ]; then
		echo " $BATPERC%"
	elif [ "$BATPERC" -le "100" ]; then
		echo " $BATPERC%"
	fi	
}

# Print the percentage
while true; do
        echo "%{l}    $(Volume) %{c}$(Clock) %{r}$(Battery)    "
        sleep 1;
done
