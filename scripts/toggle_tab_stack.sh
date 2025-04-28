
#!/bin/bash

layout=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .layout')

if [ "$layout" = "tabbed" ]; then
    swaymsg layout stacked
elif [ "$layout" = "stacked" ]; then
    swaymsg layout tabbed
else
    swaymsg layout tabbed
fi
