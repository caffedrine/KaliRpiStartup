#!/bin/bash

# Script editable from windows that is executed at startup

# Function used to log events
function log
{
    printf "["
    date +"%Y-%m-%d %H:%M:%S,%3N" | tr -d \\n
    printf "] $1\n"
}

printf "\n"
log "RPI Startup execution start..."

log "Copy wpa_supplicant from bash..."
cp /etc/wpa_supplicant/wpa_supplicant.conf /media/NTFS/startup/wpa_supplicant.conf

log "Executing startup.py..."
python /media/NTFS/startup/startup.py
