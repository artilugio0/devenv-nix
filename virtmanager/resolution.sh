#!/usr/bin/env bash

xrandr --newmode "1680x970_60.00"  134.94  1680 1784 1960 2240  970 971 974 1004  -HSync +Vsync
xrandr --addmode Virtual-1 1680x970_60.00 
xrandr --output Virtual-1 --mode 1680x970_60.00
