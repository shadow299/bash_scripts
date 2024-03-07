#! /bin/bash
source ./scan.lib

#Tasks
#use Functions
#scanning multiple domains
#create a directory with appropriate name
#start nmap and save report to a file
#start directory recon and save it in another file


getopts "m:" OPTION
MODE=$OPTARG

for i in "${@:$OPTIND:$#}"
do

    DOMAIN=$i

    TODAY=$(date)

    echo "[*] This scan was created on $TODAY"

    if [ -d  ${DOMAIN}_recon ]
    then
        echo "[*] Directory exists. proceding forward."

    else
        echo "[*] Creating directory ${DOMAIN}_recon"
        mkdir ${DOMAIN}_recon

    fi


    case $MODE in
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

done

