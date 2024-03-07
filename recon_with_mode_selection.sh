#! /bin/bash

#Tasks
#use conditionals
#create a directory with appropriate name
#start nmap and save report to a file
#start directory recon and save it in another file

DOMAIN=$1

TODAY=$(date)

echo "[*] This scan was created on $TODAY"

echo "[*] Creating directory ${DOMAIN}_recon"

mkdir ${DOMAIN}_recon

if [ $2 == "nmap-only" ]
then

	echo "[*] Starting nmap search on $DOMAIN"

	nmap $DOMAIN > ${DOMAIN}_recon/${DOMAIN}_nmap.txt

	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_nmap.txt"

elif [ $2 == "dirsearch-only" ]
then

	echo "[*] Starting dirsearch on $DOMAIN"

	dirsearch -u $DOMAIN -e php > ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt

	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt"

else
	echo "[*] Starting nmap search on $DOMAIN"

	nmap $DOMAIN > ${DOMAIN}_recon/${DOMAIN}_nmap.txt

	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_nmap.txt"

	echo "[*] Starting dirsearch on $DOMAIN"

	dirsearch -u $DOMAIN -e php > ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt

	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt"
fi