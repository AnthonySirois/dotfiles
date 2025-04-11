#!/bin/sh
CURRENT_WS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
TARGET_WS=$1
TEMP_WS=$2

if [ -z "$TARGET_WS" ]; then
    echo "Usage: $0 <target_workspace> <temporary_workspace>"
    exit 1
fi

if [ -z "$TEMP_WS" ]; then
    echo "Usage: $0 <target_workspace> <temporary_workspace>"
    exit 1
fi

if [ -z "$CURRENT_WS" ]; then
    echo "Current workspace not found."
    exit 1
fi

if [ "$CURRENT_WS" = "$TARGET_WS" ]; then
    echo "Already on target workspace."
    exit 0
fi

i3-msg "rename workspace $CURRENT_WS to $TEMP_WS; rename workspace $TARGET_WS to $CURRENT_WS; rename workspace $TEMP_WS to $TARGET_WS"