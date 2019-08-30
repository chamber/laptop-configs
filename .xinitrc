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
xset +fp /usr/share/fonts/OTF
xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/Type1
xset +fp /usr/share/fonts/misc
xset fp rehash

#Bindkeys
xbindkeys &

# MPD daemon start (if no other user instance exists)
#[ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf &

udiskie &

#Sort clipboards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

sleep 10 && ~/.dropbox-dist/dropboxd &

#Set auto lock
xautolock -time 10 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 3 &

exec urxvt &
sleep 3 && exec chromium &
sleep 4 && exec pcmanfm &

compton &

sleep 15 && google-musicmanager &

exec dwm
