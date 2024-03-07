#! /bin/bash

#Tasks
#use Functions
#create a directory with appropriate name
#start nmap and save report to a file
#start directory recon and save it in another file

DOMAIN=$1

TODAY=$(date)

echo "[*] This scan was created on $TODAY"

echo "[*] Creating directory ${DOMAIN}_recon"

mkdir ${DOMAIN}_recon

NmapScan(){
    echo "[*] Starting nmap search on $DOMAIN"

	nmap $DOMAIN > ${DOMAIN}_recon/${DOMAIN}_nmap.txt

	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_nmap.txt"
}

DirSearchScan(){
    echo "[*] Starting dirsearch on $DOMAIN"

	dirsearch -u $DOMAIN -e php > ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt

	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_dirsearch.txt"
}

CrtScan(){
    echo "[*] Starting crt.sh on $DOMAIN"
	curl "https://crt.sh/?q=$DOMAIN&output=json" -o ${DOMAIN}_recon/cert.txt
	echo "[*] Result stored in ${DOMAIN}_recon/${DOMAIN}_recon/cert.txt"
}

case $2 in
	nmap_only)
		NmapScan
		;;

	dirsearch_only)
        DirSearchScan
		;;

	crt_only)
		CrtScan
		;;

	*)
		NmapScan
        DirSearchScan
        CrtScan
		;;

esac