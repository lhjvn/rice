#!/usr/bin/env bash
sink="@DEFAULT_SINK@"

vol="$(pactl get-sink-volume "$sink" | awk '{print $5}' | head -n1 | sed 's/%//')"
muted="$(pactl get-sink-mute "$sink" | awk '{print $2}')"

if [ "$muted" = "yes" ]; then
  echo "  0"
else
  echo "${vol}%"
fi

