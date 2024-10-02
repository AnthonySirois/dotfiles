#!/usr/bin/env bash

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# lock after 300 more seconds` \
  --timer 300 \
    'dunstctl set-paused true; $HOME/.dotfiles/system/suspend.sh' \
    'dunstctl set-paused false' \
  `# Finally, suspend 30 mins after it locks` \
  --timer 1800 \
    'systemctl suspend' \
    'dunstctl set-paused false'