#! /bin/bash

#Tasks
#create a directory with appropriate name
#start nmap and save report to a file
#start directory recon and save it in another file

echo "[*] createing a directory with named $1_recon"
mkdir $1_recon

nmap $1 > $1_recon/nmap_$1.txt

echo "[*] Result of nmap stored in $1_recon/nmap_$1.txt"

echo "[*] starting dirsearch on $1"

dirsearch -u $1 -e php > $1_recon/dirsearch_$1.txt

echo "[*] Result of Dirsearch stored in $1_recon/dirsearch_$1.txt"