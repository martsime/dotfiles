#!/bin/sh

# Swap caps lock and ctrl
setxkbmap -option ctrl:swapcaps

# Swap alt and super
setxkbmap -option altwin:swap_alt_win

xbindkeys

# Repeating key interval
xset r rate 200 25
