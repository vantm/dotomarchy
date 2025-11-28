#!/bin/bash

FLOATING_STATUS="$(hyprctl activewindow -j | jq -r '.floating')"

hyprctl dispatch togglefloating

if [ "$FLOATING_STATUS" = "false" ]; then
    hyprctl dispatch resizeactive exact 60% 80%
    hyprctl dispatch centerwindow
fi