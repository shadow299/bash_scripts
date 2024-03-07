#! /bin/bash

#Tasks
#create a directory with appropriate name
#start nmap and save report to a file
#start directory recon and save it in another file

DOMAIN=$1

echo "[*] Creating directory ${DOMAIN}_recon"

mkdir ${DOMAIN}_recon

echo "[*] Starting nmap search on $DOMAIN"

nmap $DOMAIN > ${DOMAIN}_recon/${DOMAIN}_nmap.txt

echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_nmap.txt"

echo "[*] Starting dirsearch on $DOMAIN"

dirsearch -u $DOMAIN -e php > ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt

echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt"