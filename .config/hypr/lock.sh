#!/usr/bin/bash

timefade=$1
timegrace=$2

swaylock --clock -i /home/wefeng/Pictures/My_Wallpapers/SpiritedAway/wp8575978.png \
  --inside-color ffe5bf --ring-color 62b9e9 -n \
  --key-hl-color ffe5bf --separator-color ffe5bf \
  --font "ComicShanns mono nerd font" \
  --text-color 62b9e9 --indicator-x-position 100 --indicator-y-position 100 \
  --fade-in $timefade \
  --indicator-idle-visible #--grace $timegrace 
  
