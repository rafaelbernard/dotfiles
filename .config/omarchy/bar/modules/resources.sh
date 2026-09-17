#!/bin/bash
# Resource monitor + alarm for the Omarchy shell bar.
# Outputs JSON understood by the command bar widget:
#   {"text":"...","tooltip":"...","class":"active"|""}
#
# Fires a desktop notification (via omarchy notification send) only on
# state transitions — not on every poll — to avoid notification spam.
#
# Thresholds (edit as needed):
MEM_THRESHOLD=85    # alert when memory usage >= this %
SWAP_THRESHOLD=20   # alert when swap usage >= this %

STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/omarchy-resources-alarm.state"
NOTIF_ID=9100       # stable id so the alarm notification replaces itself

# --- CPU (sample /proc/stat over 0.5s for a real delta) ---
read_cpu() {
  local line fields
  line=$(awk '/^cpu /{print; exit}' /proc/stat)
  # shellcheck disable=SC2206
  fields=($line)
  # total = user+nice+system+idle+iowait+irq+softirq+steal
  echo $(( fields[1] + fields[2] + fields[3] + fields[4] + fields[5] + fields[6] + fields[7] + fields[8] ))
  echo $(( fields[4] + fields[5] ))  # idle = idle + iowait
}

mapfile -t s1 < <(read_cpu)
sleep 0.5
mapfile -t s2 < <(read_cpu)

total_diff=$(( s2[0] - s1[0] ))
idle_diff=$(( s2[1] - s1[1] ))
if [ "$total_diff" -gt 0 ]; then
  cpu_pct=$(( 100 * (total_diff - idle_diff) / total_diff ))
else
  cpu_pct=0
fi

# --- Memory and Swap (from free, in bytes) ---
mem_total=$(free -b  | awk '/^Mem:/{print $2}')
mem_used=$(free -b   | awk '/^Mem:/{print $3}')
mem_avail=$(free -b  | awk '/^Mem:/{print $7}')
swap_total=$(free -b | awk '/^Swap:/{print $2}')
swap_used=$(free -b  | awk '/^Swap:/{print $3}')

mem_pct=$(( 100 * mem_used / mem_total ))
if [ "$swap_total" -gt 0 ] 2>/dev/null; then
  swap_pct=$(( 100 * swap_used / swap_total ))
else
  swap_pct=0
  swap_total=1
fi

# Human-readable sizes
hr() { awk -v b="$1" 'BEGIN{split("B K M G T",u); i=1; while(b>=1024&&i<5){b/=1024;i++} printf "%.1f%s",b,u[i]}'; }

# --- Build output text ---
text=$(printf "CPU %d%% | RAM %d%% | SWP %d%%" "$cpu_pct" "$mem_pct" "$swap_pct")
tooltip=$(printf "CPU: %d%%\nRAM: %d%% (%s / %s)\nSwap: %d%% (%s / %s)" \
  "$cpu_pct" "$mem_pct" "$(hr "$mem_used")" "$(hr "$mem_total")" \
  "$swap_pct" "$(hr "$swap_used")" "$(hr "$swap_total")")

# --- Alarm logic (state-transition only) ---
alarm=false
reasons=""
[ "$mem_pct" -ge "$MEM_THRESHOLD" ] && { alarm=true; reasons+="Memory at ${mem_pct}% (threshold ${MEM_THRESHOLD}%)\\n"; }
[ "$swap_pct" -ge "$SWAP_THRESHOLD" ] && { alarm=true; reasons+="Swap at ${swap_pct}% (threshold ${SWAP_THRESHOLD}%)\\n"; }

prev=$(cat "$STATE_FILE" 2>/dev/null || echo false)

if [ "$alarm" = true ]; then
  klass="active"
  if [ "$prev" != "true" ]; then
    omarchy notification send -u critical -r "$NOTIF_ID" \
      "Resource alarm" "$(printf '%b' "$reasons")" 2>/dev/null &
    echo true > "$STATE_FILE"
  fi
else
  klass=""
  if [ "$prev" = "true" ]; then
    omarchy notification send -u low -r "$NOTIF_ID" \
      "Resource alarm cleared" "Memory and swap back to normal." 2>/dev/null &
    echo false > "$STATE_FILE"
  fi
fi

# --- Output JSON (built with jq for safe escaping) ---
jq -cn \
  --arg text "$text" \
  --arg tooltip "$tooltip" \
  --arg class "$klass" \
  '{text:$text, tooltip:$tooltip, class:$class}'
