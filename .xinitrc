#!/bin/sh

xrdb -merge ~/.Xresources

export BROWSER=chromium & 
export EDITOR=vim &

(conky | while read LINE; do xsetroot -name "$LINE"; done) &

sh ~/.fehbg &

xset +fp /usr/share/fonts/local
xset fp rehash

exec dwm
