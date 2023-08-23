#!/bin/bash

# 1) nmap - quick scan all ports
# 2) nmap - scan open ports

if [[ -z $1 ]]
then
echo "[-] IP not found. Using: scan_ports.sh [IP]"
exit
fi

echo "[+] Processing IP: $1"
ports=$(nmap -p- --min-rate=500 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//) 

if [[ -z $ports ]]
then
echo "All 65535 scanned ports on $1 are in ignored states."
else
echo "[+] Scanning open ports: $ports"
nmap -p$ports -A $1
fi
