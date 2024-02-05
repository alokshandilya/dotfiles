#!/bin/sh

function get_bytes {
    local wifi_interface=$(ip link | grep -E '^[0-9]+: (wlan|wifi|wlp|wl|eth)' | awk -F ': ' '{print $2}')
    local eth_interface=$(ip link | grep -E '^[0-9]+: (eth|enp)' | awk -F ': ' '{print $2}')

    if [ -n "$wifi_interface" ]; then
        local interface="$wifi_interface"
    elif [ -n "$eth_interface" ]; then
        local interface="$eth_interface"
    else
        local interface="lo"  # Use loopback interface as a fallback
    fi

    local bytes_concat_args=$(grep "$interface" /proc/net/dev | cut -d ':' -f 2 | awk -v rb="$1" -v tb="$2" '{print rb"="$1, tb"="$9}')
    eval $bytes_concat_args
}

# Speed is shown in KByte per second when greater or equal than 1 KByte per second.
# This function should be called each second.
function get_velocity {
    local timediff=$(($3 - $4))
    local vel_kb=$(echo "1000000000 * ($1 - $2) / 1024 / $timediff" | bc)
    if test "$vel_kb" -gt 1024; then
        echo $(echo "scale = 2; $vel_kb / 1024" | bc)MB/s
    else
        echo ${vel_kb}KB/s
    fi
}

function dwm_network_speed_record {
    get_bytes 'received_bytes' 'transmitted_bytes'
    old_received_bytes=$received_bytes
    old_transmitted_bytes=$transmitted_bytes

    old_time=$(date +%s%N)
}

function download_speed {
    get_velocity $received_bytes $old_received_bytes $now $old_time
}

function upload_speed {
    get_velocity $transmitted_bytes $old_transmitted_bytes $now $old_time
}

# The greater interval ($now - $old_time) is, the be exacter the speed is.
function dwm_network_speed {
    get_bytes 'received_bytes' 'transmitted_bytes'
    now=$(date +%s%N)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "🔻%s 🔺%s"  "$(download_speed)" "$(upload_speed) "
    else
        printf "🔻%s 🔺%s"  "$(download_speed)" "$(upload_speed) "
    fi
    printf "%s\n" "$SEP2"
}

dwm_network_speed_record
dwm_network_speed
