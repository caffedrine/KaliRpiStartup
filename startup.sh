# Script editable from windows that is executed at startup

# Function used to log events
function log
{
    printf "["
    date +"%Y-%m-%d %H:%M:%S,%3N" | tr -d \\n
    printf "] $1\n"
}

log "RPI Startup execution start..."

log "Executing startup.py..."
python startup.py
