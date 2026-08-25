#!/bin/bash
# Slack badge bar widget — reads unread stats from Slack Desktop's Local Storage
# leveldb and outputs Waybar-style JSON for the Omarchy shell command module.
#
# Badge count = badgedDmsCount + badgedThreadsCount + badgedActivityCount
#               + badgedLaterCount, summed across all workspaces.
# Unread count = unreadDmConversationsCount + unreadChannelsCount (no badge,
#               just bold in the sidebar) — included in the tooltip.

set -euo pipefail

SLACK_LS="$HOME/.config/Slack/Local Storage/leveldb"

if [[ ! -d "$SLACK_LS" ]]; then
  echo '{"text":"\uf198","tooltip":"Slack — not installed","class":"inactive"}'
  exit 0
fi

# Read all leveldb files, extract the latest stats JSON per team, sum badges.
# `strings` pulls readable JSON from the binary leveldb/log files.
read -r -d '' PYSCRIPT <<'PYEOF' || true
import json, sys, subprocess

latest = {}
for line in sys.stdin:
    line = line.strip()
    if '"stats":{' not in line:
        continue
    try:
        obj = json.loads(line)
    except (json.JSONDecodeError, ValueError):
        continue
    team = obj.get("teamId", "unknown")
    ts = obj.get("timestamp", "")
    if team not in latest or ts > latest[team]["ts"]:
        s = obj.get("stats", {})
        latest[team] = {
            "ts": ts,
            "badge": (s.get("badgedDmsCount", 0)
                      + s.get("badgedThreadsCount", 0)
                      + s.get("badgedActivityCount", 0)
                      + s.get("badgedLaterCount", 0)),
            "unread": s.get("unreadDmConversationsCount", 0)
                      + s.get("unreadChannelsCount", 0),
        }

total_badge = sum(v["badge"] for v in latest.values())
total_unread = sum(v["unread"] for v in latest.values())
teams = len(latest)

if total_badge > 0:
    text = f"\uf198 {total_badge}"
    cls = "badged"
elif total_unread > 0:
    text = f"\uf198"
    cls = "unread"
else:
    text = f"\uf198"
    cls = "idle"

tooltip = f"Slack — {teams} workspace{'s' if teams != 1 else ''}"
if total_badge > 0:
    tooltip += f" · {total_badge} badge{'s' if total_badge != 1 else ''}"
if total_unread > 0:
    tooltip += f" · {total_unread} unread"

print(json.dumps({"text": text, "tooltip": tooltip, "class": cls}))
PYEOF

strings "$SLACK_LS"/*.log "$SLACK_LS"/*.ldb 2>/dev/null | python3 -c "$PYSCRIPT"
