#!/bin/bash
# World clocks bar widget — outputs text for the Omarchy shell command module.
# Format: | BR 17 06:41 | ASyd 17 19:41 | CAlb 17 03:41 | POR 17 10:41

out=""
for spec in \
  "BR:America/Sao_Paulo" \
  "ASyd:Australia/Sydney" \
  "CAlb:America/Edmonton" \
  "POR:Europe/Lisbon"
do
  label="${spec%%:*}"
  tz="${spec##*:}"
  out+=" | ${label} $(TZ="$tz" date '+%d %H:%M')"
done

echo "${out# }"
