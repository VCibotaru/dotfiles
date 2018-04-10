#!/bin/zsh
count=`ps aux | grep -v runorraise | grep -c $1`
if [ $count -eq 1 ]; then
   i3-msg "workspace $3; exec $1"
fi
i3-msg "[class=$2] focus"

