#!/bin/bash

bitfile="$1"


if ! command -v xc3sprog &> /dev/null
then
    echo "xc3sprog could not be found. Please install it before running this script."
    exit 1
fi


if [[ "${bitfile##*.}" != "bit" ]]; then
    echo "----------------------------------------"
    echo "ERROR. Please provide a .bit file!"
    echo "----------------------------------------"
    exit 1
fi


clear
echo -e "\e[33m"
echo "---------------------------------------v1.0----------------------------------------------"
echo "███████╗██████╗░░██████╗░░█████╗░███████╗██╗░░░░░░█████╗░░██████╗██╗░░██╗███████╗██████╗░"
echo "██╔════╝██╔══██╗██╔════╝░██╔══██╗██╔════╝██║░░░░░██╔══██╗██╔════╝██║░░██║██╔════╝██╔══██╗"
echo "█████╗░░██████╔╝██║░░██╗░███████║█████╗░░██║░░░░░███████║╚█████╗░███████║█████╗░░██████╔╝"
echo "██╔══╝░░██╔═══╝░██║░░╚██╗██╔══██║██╔══╝░░██║░░░░░██╔══██║░╚═══██╗██╔══██║██╔══╝░░██╔══██╗"
echo "██║░░░░░██║░░░░░╚██████╔╝██║░░██║██║░░░░░███████╗██║░░██║██████╔╝██║░░██║███████╗██║░░██║"
echo "╚═╝░░░░░╚═╝░░░░░░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝"
echo "-----------------------------------============------------------------------------------"
echo "-----------------------------"
echo "File Bit From $bitfile"
echo "-----------------------------"
echo "  1 For Normal Rom (Fast - Temporary)"
echo "  2 For PROM Rom (Slow - Permanent)"
echo "-----------------------------"
read -p "Type of Flash: " input


case "$input" in
    1)
        sudo xc3sprog -c ftdi -v -p 0 "$bitfile"
        echo "Press any key to continue..."
         read -n 1 -s
        ./flash.sh "$bitfile"
        ;;
    2)
        sudo xc3sprog -c ftdi -v /path/to/spiflasherLX9.bit
        sudo xc3sprog -c ftdi -v -R -p 0 -I "$bitfile"
        ;;
    *)
        echo "Invalid option. Please select 1 or 2."
        ;;
esac


echo -e "\e[0m"

