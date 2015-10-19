#!/bin/sh

xrdb -merge ~/.Xresources

export BROWSER=chromium & 
export EDITOR=vim &

(conky | while read LINE; do xsetroot -name "$LINE"; done) &

sh ~/.fehbg &

xset +fp /usr/share/fonts/local
xset fp rehash

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

xautolock -time 10 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 3 &

exec dwm
