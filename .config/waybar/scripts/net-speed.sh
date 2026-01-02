#!/usr/bin/env bash

IFACE=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++){if($i=="dev"){print $(i+1)}}}')
if [ -z "$IFACE" ]; then
  echo "󰖪 No Net"
  exit 0
fi

# Store previous counters in temp files
RX_FILE="/tmp/rx_$IFACE"
TX_FILE="/tmp/tx_$IFACE"

# Read current
RX_NOW=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

# Read previous or default 0
RX_PREV=$(cat $RX_FILE 2>/dev/null || echo $RX_NOW)
TX_PREV=$(cat $TX_FILE 2>/dev/null || echo $TX_NOW)

# Calculate delta in KB/s
DOWN=$(( (RX_NOW - RX_PREV)/1024 ))
UP=$(( (TX_NOW - TX_PREV)/1024 ))

# Save current counters for next run
echo $RX_NOW > $RX_FILE
echo $TX_NOW > $TX_FILE

echo "󰇚 ${DOWN}KB/s 󰕒 ${UP}KB/s"

