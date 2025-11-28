#!/bin/bash
ACTIVE_WINDOW_JSON="$(hyprctl activewindow -j)"
FLOATING_STATUS="$(echo "$ACTIVE_WINDOW_JSON" | jq -r '.floating')"
WORKSPACE_ID="$(hyprctl activeworkspace -j | jq -r '.id')"

echo "Floating status: $FLOATING_STATUS"
echo "Workspace ID: $WORKSPACE_ID"

if [ "$FLOATING_STATUS" = "true" ]; then
    hyprctl clients -j | \
    jq -r "map(select(.workspace.id == $WORKSPACE_ID and .floating == true)) | .[].address" | \
    xargs -I{} hyprctl dispatch movetoworkspacesilent special:minimized$WORKSPACE_ID,address:{}
else
    hyprctl clients -j | \
    jq -r "map(select(.workspace.name == \"special:minimized$WORKSPACE_ID\")) | .[].address" | \
    xargs -I{} hyprctl dispatch movetoworkspacesilent $WORKSPACE_ID,address:{}

    hyprctl clients -j | \
    jq -r "map(select(.workspace.id == $WORKSPACE_ID and .floating == true)) | last | .address" | \
    xargs -I{} hyprctl dispatch focuswindow address:{}
fi
