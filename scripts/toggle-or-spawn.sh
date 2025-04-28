#!/bin/sh

# Usage: toggle-or-spawn.sh <app_id> <center(true/false)> <command...>

app_id="$1"
center="$2"
shift 2
cmd="$@"

# Compose the command
if [ "$center" = "true" ]; then
    action='scratchpad show; resize set 70 ppt 70 ppt; move position center'
else
    action='scratchpad show; resize set 70 ppt 70 ppt'
fi

# Check if the window exists
if swaymsg -t get_tree | grep -q "\"app_id\": \"$app_id\""; then
    swaymsg "[app_id=\"$app_id\"] $action"
else
    $cmd &
    sleep 0.5  # allow window to map
    swaymsg "[app_id=\"$app_id\"] $action"
fi

