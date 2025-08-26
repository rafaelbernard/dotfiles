#!/bin/bash
# Toggle between NetworkManager+iwd and Impala/iwd with auto-reconnect

NM_SERVICE="NetworkManager"
IWD_SERVICE="iwd"
NETD_SERVICE="systemd-networkd"
RESOLVED_SERVICE="systemd-resolved"

# Files to store last used SSID per mode
NM_LAST="/tmp/last_nm_ssid"
IWD_LAST="/tmp/last_iwd_ssid"

# Function to get current SSID
get_current_ssid() {
    iwctl station wlan0 show | grep 'Connected network' | awk -F ': ' '{print $2}'
}

# Detect current mode
if systemctl is-active --quiet $NM_SERVICE; then
    echo "Switching to Impala/iwd mode..."
    # Save current SSID
    CURRENT_SSID=$(get_current_ssid)
    [[ -n "$CURRENT_SSID" ]] && echo "$CURRENT_SSID" > "$NM_LAST"

    # Stop NM, start networkd
    sudo systemctl stop $NM_SERVICE
    sudo systemctl restart $IWD_SERVICE
    sudo systemctl enable --now $NETD_SERVICE $RESOLVED_SERVICE

    # Auto-reconnect last iwd SSID
    if [[ -f "$IWD_LAST" ]]; then
        LAST_SSID=$(cat "$IWD_LAST")
        echo "Reconnecting to $LAST_SSID via iwd..."
        iwctl station wlan0 connect "$LAST_SSID"
    fi

    echo "Impala/iwd mode active."
else
    echo "Switching to NetworkManager+iwd mode..."
    # Save current SSID
    CURRENT_SSID=$(get_current_ssid)
    [[ -n "$CURRENT_SSID" ]] && echo "$CURRENT_SSID" > "$IWD_LAST"

    # Stop systemd-networkd, start NM
    #sudo systemctl disable --now $NETD_SERVICE $RESOLVED_SERVICE
    echo "NetworkManager is handing off DNS to systemd-resolved"
    sudo systemctl enable --now $NETD_SERVICE $RESOLVED_SERVICE
    sudo systemctl restart $NETD_SERVICE $RESOLVED_SERVICE
    sudo systemctl restart $IWD_SERVICE
    sudo systemctl start $NM_SERVICE

    # Auto-reconnect last NM SSID
    if [[ -f "$NM_LAST" ]]; then
        LAST_SSID=$(cat "$NM_LAST")
        echo "Reconnecting to $LAST_SSID via NM..."
        nmcli connection up "$LAST_SSID"
    fi

    # Start nm-applet in tray
    nm-applet --indicator &

    echo "NetworkManager mode active."
fi

