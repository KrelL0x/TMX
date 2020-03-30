#!/bin/bash
# Author : KrelL0x |
# Date   : 30.03.20|

set -o nounset -o errexit
  clear

# Farben

red='\e[91m'
green='\e[32m'
yellow='\e[33m'
blue='\e[34m'
purple='\e[96m'
std='\e[0m'
fett='\e[1m'
RED='\e[101m'


# Abfrage das zu Installierende Paket.
logo() { 
clear
echo "                                            ";
echo "           __  __   ___                      ";
echo "          |  |/  \`.'   \`.                    ";
echo "      .|  |   .-.  .-.   '                   ";
echo "    .' |_ |  |  |  |  |  | ____     _____    ";
echo "  .'     ||  |  |  |  |  |\`.   \  .'    /    ";
echo " '--.  .-'|  |  |  |  |  |  \`.  \`'    .'     ";
echo "    |  |  |  |  |  |  |  |    '.    .'       ";
echo "    |  |  |__|  |__|  |__|    .'     \`.      ";
echo "    |  '.'                  .'  .'\`.   \`.    ";
echo "    |   /                 .'   /    \`.   \`.  ";
echo "    \`'-'                 '----'       '----' ";
echo  -e  "\e[44m ${fett}Kleines aber Feines Tool von KrelL0x Version beta1.0 ${std}"
echo " "
}
Termux-Pakete() {
echo " "
clear
echo -e "\e[33m   Termux-Pakte\e[0m"
echo " Gib nur den Paket-Namen ein, z.b fish."
read -p " Was willst du installieren ? : " Pakete 
echo " "
sleep 2
Termux-Install

}
Termux-Install() {
clear
echo -e "Ok,\e[32m [$Pakete] \e[0mwird nun installiert" && sleep 2
pkg install $Pakete
sleep 2 && clear
echo " "
echo -e " \e[32m [$Pakete] \e[0mist nun installiert."
sleep 2
read_options2
}

read_options2() {

local frage
echo -e "${red} "
read -p " Fortfahren ? Type [J/N] : " frage
echo -e "${std}"
clear
case $frage in
j) Termux-abfrage ;;
n) read_options ;;
J) Termux-abfrage ;;
N) read_options ;;
*) echo -e "${red} Error.. ${fett}${green}(J=Ja / N=Nein)${std}" && sleep 3 && read_options2
clear 
esac
}

Termux-abfrage() {
clear
sleep 1
echo " "
echo -e "\e[33m   Termux-Pakte\e[0m"
read -p " Was willst du installieren ? : " Pakete
Termux-Install
}

##############################################################################
#Termux deinstall
Termux-deinstall-Pakete() {
clear 
sleep 1
echo " "
echo -e "${red} Termux-Pakte\e[0m"
echo " Gib nur den Paket-Namen ein, z.b fish."
read -p " Was willst du Deinstallieren ? : " deinstall
echo " " && sleep 2
clear
Termux-Deinstall
}

Termux-Deinstall() {
clear
echo -e "Ok,\e[32m [$deinstall] \e[0mwird nun deinstalliert." && sleep 2
pkg uninstall $deinstall
sleep 2 && clear
echo " "
echo -e " \e[32m [$deinstall] \e[0mist nun deinstalliert."
read -p " Drück [ENTER] zum Fortfahren" && clear
read_options3
}

read_options3() {
local frage
echo -e "${red} "
read -p " Fortfahren ? Type [J/N]" frage
echo -e "${std}"
clear
case $frage in
j) deinstall-abfrage ;;
n) read_options ;;
J) deinstall-abfrage ;;
N) read_options ;;
*) echo -e "${red} Error.. ${fett}${green}(J=Ja / N=Nein)${std}" && sleep 3 && read_options3
clear
esac
}





deinstall-abfrage(){
clear
sleep 1
echo " "
echo -e "\e[33m   Termux-Pakte-Deinstall\e[0m"
read -p " Was willst du Deinstallieren ? : " deinstall
Termux-Deinstall
}

Apt-List() {
	clear
pkg list-all
echo -e "${red}"
read -p "Bist du Fertig ? dann drück [ENTER]. "
echo -e "${std}"
read_options
}


read_options(){
logo
echo -e "${purple} [${std}1${purple}] ${std}Termux-Install-Pakete "
echo -e "${purple} [${std}2${purple}] ${std}Termux-Deinstall-Pakete "
echo -e "${purple} [${std}3${purple}] ${std}show PKG list "
echo -e "${purple} [${std}0${purple}] ${std}exit "
     local choice
     read -p " ##>  " choice
     case $choice in
         1) Termux-Pakete ;;
         2) Termux-deinstall-Pakete ;;
         3) Apt-List ;;
         0) exit 0;;
         *) echo -e "${RED}Error...${std}" && sleep 1
     esac
}


while true; do
read_options
clear && sleep 1
done
