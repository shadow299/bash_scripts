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

case $2 in
	nmap_only)
		echo "[*] Starting nmap search on $DOMAIN"

		nmap $DOMAIN > ${DOMAIN}_recon/${DOMAIN}_nmap.txt

		echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_nmap.txt"
		;;

	dirsearch_only)

		echo "[*] Starting dirsearch on $DOMAIN"

		dirsearch -u $DOMAIN -e php > ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt

		echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt"
		;;

	crt_only)
		echo "[*] Starting crt.sh on $DOMAIN"
		curl "https://crt.sh/?q=$DOMAIN&output=json" -o ${DOMAIN}_recon/cert.txt
		echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_recon/cert.txt"
		;;

	*)
		echo "[*] Starting nmap search on $DOMAIN"

		nmap $DOMAIN > ${DOMAIN}_recon/${DOMAIN}_nmap.txt

		echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_nmap.txt"

		echo "[*] Starting dirsearch on $DOMAIN"

		dirsearch -u $DOMAIN -e php > ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt

		echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt"
		;;

esac