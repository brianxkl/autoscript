#!/bin/bash
clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m             SSH WEBSOCKET MENU             \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m

 [\033[1;36m•1 \033[0m]  Create SSH Account
 [\033[1;36m•2 \033[0m]  Trial SSH Account
 [\033[1;36m•3 \033[0m]  Renew SSH Account
 [\033[1;36m•4 \033[0m]  Delete SSH Account
 [\033[1;36m•5 \033[0m]  Check User Login SSH Account
 [\033[1;36m•6 \033[0m]  List Member SSH Account
 [\033[1;36m•7 \033[0m]  Delete User Expired SSH Account
 [\033[1;36m•8 \033[0m]  Set up Autokill SSH
 [\033[1;36m•9 \033[0m]  Check Users Who Do Multi Login SSH
 [\033[1;36m•10\033[0m]  Back To Main Menu"
echo ""
echo -e " \033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       usernew
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 2 ]]; then
       trial
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 3 ]]; then
       renew
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 4 ]]; then
       hapus
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 5 ]]; then
       cek
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 6 ]]; then
       member
	   read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 7 ]]; then
       delete
	   read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 8 ]]; then
       autokill
	   read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 9 ]]; then
       ceklim
	   read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq 10 ]]; then
       clear
       menu
    else
       clear
       menu-ssh
    fi
fi
