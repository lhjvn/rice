#!/usr/bin/env bash

# Get battery line, e.g.:
# "Battery 0: Charging, 99%"
# or  "Battery 0: Discharging, 99%"
line="$(acpi -b 2>/dev/null | head -n1)"

# Default if acpi returns nothing
LEVEL=0
STATUS="Unknown"

if [[ "$line" =~ ([Cc]harging|[Dd]ischarging|Full) ]]; then
  STATUS="${BASH_REMATCH[1]}"
fi

if [[ "$line" =~ ([0-9]+)% ]]; then
  LEVEL="${BASH_REMATCH[1]}"
fi

# Icons (Nerd Font)
if [[ "$STATUS" == "Charging" ]]; then
  ICON=""
elif (( LEVEL >= 80 )); then
  ICON=""
elif (( LEVEL >= 60 )); then
  ICON=""
elif (( LEVEL >= 40 )); then
  ICON=""
elif (( LEVEL >= 20 )); then
  ICON=""
else
  ICON=""
fi

echo "${ICON} ${LEVEL}%"

