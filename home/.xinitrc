#!/bin/sh

userresources=$XDG_CONFIG_HOME/X11/Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ ! -L "/etc/X11/xorg.conf.d/40-libinput.conf" ] && [ -f "$XDG_CONFIG_HOME/X11/40-libinput.conf" ]; then
    sudo ln -fs "$XDG_CONFIG_HOME/X11/40-libinput.conf" "/etc/X11/xorg.conf.d"
fi

# Swap ctrl key with caps lock
setxkbmap -option ctrl:swapcaps

# Swap left alt with super
setxkbmap -option altwin:swap_alt_win

# Key repeat delay / rate in ms
xset r rate 200 25

# Start Xorg instance with i3 as window manager
exec i3
