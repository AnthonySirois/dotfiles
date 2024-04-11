#!/bin/sh

SCREEN_WIDTH=2560 
SCREEN_HEIGHT=1440

DEFAULT='#cba6f7'
TEXT='#cdd6f4'
WRONG='#f38ba8'
VERIFYING='#fab387'

# Pause notifications while the screen is locked
# The -n parameter in i3lock is necessary
dunstctl set-paused true

i3lock \
  -n \
  --verif-text="Verifying" \
  --wrong-text="Incorrect password" \
  --noinput-text="No input" \
  \
  --ringver-color=$VERIFYING \
  --ringwrong-color=$WRONG \
  --keyhl-color=$DEFAULT \
  --bshl-color=$DEFAULT \
  \
  --verif-color=$VERIFYING \
  --wrong-color=$WRONG \
  --modif-color=$TEXT \
  --time-color=$TEXT \
  --date-color=$TEXT \
  --layout-color=$TEXT \
  \
  --screen 1 \
  --clock \
  --blur 7 \
  --indicator \
  --time-str="%H:%M:%S" \
  --date-str="%d-%m-%Y" \
  --ignore-empty-password \
  --bar-indicator \
  --bar-direction 1 \
  --bar-step 192 \
  --bar-max-height 576 \
  --bar-base-width 5 \
  --bar-color=$DEFAULT \
  --bar-periodic-step 72 \
  --bar-pos h \
  --bar-count 278 \
  --bar-total-width $SCREEN_WIDTH+80 \
# For some unknown reason, the screen width does not cover the whole screen

dunstctl set-paused false
