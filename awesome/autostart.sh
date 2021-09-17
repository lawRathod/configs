#! /bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run copyq
run dunst
run xss-lock -v -l xsecurelock
run picom
run nm-applet
run pasystray
run flameshot
run "/home/law/apps/scripts/monitor.sh"
run "/home/law/apps/scripts/laptop-right.sh"
run nitrogen --restore &
