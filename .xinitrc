#!/bin/sh

# IM settings
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon --xim -d

# Load URXVT setting
# xrdb -merge ~/.Xresources

# no beep
xset -b

# set local fonts
xset +fp /usr/share/fonts
xset fp rehash

# screensaver
xscreensaver &

# background & transparent
# feh --bg-fill ~/Downloads/background/water.jpg
feh --bg-fill ~/Downloads/background/rainflow.jpg
xcompmgr &

# WM: xmonad
exec xmonad
