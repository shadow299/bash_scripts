#! /bin/bash
source ./scan.lib

#Tasks
#use Functions
#scanning multiple domains
#create a directory with appropriate name
#start nmap and save report to a file
#start directory recon and save it in another file

while getopts "m:i" OPTION
do
    case $OPTION in
    m)
        MODE=$OPTARG
        ;;
    i)
        INTRACTIVE=true
        ;;
    esac
done

scan_domain(){
    DOMAIN=$1

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
}

if [ $INTRACTIVE ]
then
    INPUT="BLANK"
    
    while [ $INPUT != "quit" ]
    do
        echo "Please enter a domain"
        read INPUT
        if [ $INPUT != "quit" ]
        then
            scan_domain $INPUT
        fi
    done
else
    for i in "${@:$OPTIND:$#}"
    do
        scan_domain $if
    done
fi
