#!/usr/bin/env bash

# Get binding modes JSON and detect if resize mode is active
# Works with i3/sway that supports: i3-msg -t get_binding_modes
json="$(i3-msg -t get_binding_modes 2>/dev/null)"

if command -v jq >/dev/null 2>&1; then
  active="$(echo "$json" | jq -r '.[] | select(.name=="resize" and .active==true) | .name' | head -n1)"
else
  # No jq: fallback heuristic
  # If "resize" appears near "active": true, treat as active
  active="$(echo "$json" | tr -d '\n' | grep -o '"name":"resize"[^}]*"active":true' | head -n1)"
fi

if [ -n "$active" ]; then
  echo " RESIZE"   # Nerd Font icon (may vary); looks fine in CommitMono
else
  echo " NORMAL"
fi

