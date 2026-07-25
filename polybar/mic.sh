#!/usr/bin/env bash
src="@DEFAULT_SOURCE@"

vol="$(pactl get-source-volume "$src" | awk '{print $5}' | head -n1 | sed 's/%//')"
muted="$(pactl get-source-mute "$src" | awk '{print $2}')"

if [ "$muted" = "yes" ]; then
  echo "  0"
else
  echo "${vol}%"
fi

