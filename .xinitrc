#!/bin/sh

#Xresoures setup
xrdb -merge ~/.Xresources

#defaults
export BROWSER=chromium & 
export EDITOR=vim &

#set info bar
(conky | while read LINE; do xsetroot -name "$LINE"; done) &

#background
sh ~/.fehbg &

#Fonts
xset +fp /usr/share/fonts/local
xset fp rehash

#Bindkeys
xbindkeys &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf &

#Sort clipboards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#Set auto lock
xautolock -time 10 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 3 &

exec urxvt &
exec chromium &
exec pcmanfm &

exec dwm
