#!/bin/bash

# end all running bars
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	  # my 4k monitor is in DP-0
	  if [ "$m" = "DP-0" ]; then
    		MONITOR=$m polybar --reload right &
	  else
		MONITOR=$m polybar --reload main &
	  fi
  done
fi
