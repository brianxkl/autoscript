#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\\E[0;41;36m       Delete SSH WS Account       \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -p "Username SSH To Delete : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User ${green}$Pengguna${NC} was removed."
		echo -e ""
        echo -e "Autoscript By Brian"
        echo -e ""
else
        echo -e "Failure: User ${red}$Pengguna${NC} Not Exist."
		echo -e ""
        echo -e "Autoscript By Brian"
        echo -e ""
fi
