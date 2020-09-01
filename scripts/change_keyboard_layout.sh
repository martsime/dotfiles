#!/bin/sh

current_map=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
if [ $current_map = 'us' ]
then
	setxkbmap no
else
	setxkbmap us
fi

source $DOTFILES/scripts/key_remap.sh
