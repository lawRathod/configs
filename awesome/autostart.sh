#!/usr/bin/env bash

function run {
  if ! pgrep -x $1 ;
  then
    $@&
  fi
}

run pasystray
run copyq
run nm-applet --indicator
run picom
run caffeine
run flameshot
run blueberry-tray
# run kitty -e lvim
# run code
run telegram-desktop
run slack
run brave

# ~/.screenlayout/lg-ultrawide.sh

light -I
# dunst --config $HOME/.config/dunst/dunstrc &
xss-lock -v -l xsecurelock &

autorandr --load acer

sleep 2
nitrogen --restore
