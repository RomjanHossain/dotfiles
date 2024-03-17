#!/bin/bash

ACTION="$HOME/.config/i3/scripts/calendar"

# handle button actions
case $BLOCK_BUTTON in
	1) # click
		$ACTION curr
	;;
	4) # scroll up
		$ACTION next
	;;
	5) #scroll down
		$ACTION prev
	;;
esac

# i3block
DATE=$(date '+%b %d')
CALI=" 󰸘 "
echo "$CALI$DATE "
