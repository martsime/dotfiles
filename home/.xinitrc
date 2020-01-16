#!/bin/sh

userresources=$XDG_CONFIG_HOME/X11/Xresources
usermodmap=$XDG_CONFIG_HOME/X11/Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ] ; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ ! -L "/etc/X11/xorg.conf.d/40-libinput.conf" ] && [ -f "$XDG_CONFIG_HOME/X11/40-libinput.conf" ]; then
    sudo ln -fs "$XDG_CONFIG_HOME/X11/40-libinput.conf" "/etc/X11/xorg.conf.d"
fi

# Swap ctrl key with caps lock
setxkbmap -option ctrl:swapcaps

# Swap left alt with super
setxkbmap -option altwin:swap_alt_win

# Bind keyboard shortcuts
xbindkeys

# Key repeat delay / rate in ms
xset r rate 200 25

# Start Xorg instance with i3 as window manager
exec i3
