#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple='\e[0;35m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
echo -e "${green}Welcome${NC}"
clear

BURIQ() { :; }

echo $Name >/usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman() {
    if [[ -f "/etc/.$Name.ini" ]]; then
        CekTwo=$(cat /etc/.$Name.ini)
        if [[ "$CekOne" = "$CekTwo" ]]; then
            res="Expired"
        fi
    else
        res="Permission Accepted..."
    fi
}

PERMISSION() {
    res="Permission Accepted..."
}
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
MYIP=$(wget -qO- icanhazip.com/ip);

echo -e "[ ${yell}INFO${NC} ] Autoscript SSH XRAY Websocket Multiport By Brian"
echo ""
echo -e "[ ${yell}NOTES${NC} ] Before we continue ... "
sleep 1
echo ""
echo -e "[ ${yell}NOTES${NC} ] I need check your headers first ..."
sleep 1
echo ""
echo -e "[ ${green}INFO${NC} ] Checking headers ..."
sleep 1
echo ""
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 2
  echo -e "[ ${red}WARNING${NC} ] System is updating now ..."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] If error occur , you need to do this steps ..."
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] 1. apt update -y"
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] 2. apt upgrade -y"
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] 3. apt dist-upgrade -y"
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] 4. reboot"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] After rebooting"
  sleep 1
  echo -e "[ ${yell}NOTES${NC} ] Then run this script again ..."
  echo -e "[ ${yell}NOTES${NC} ] If you understand , Please tap enter now to continue autoscript installation ..."
  read
else
  echo -e "[ ${green}INFO${NC} ] Autoscript Installation Begin !"
fi

ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}
start=$(date +%s)

echo -e "[ ${green}INFO${NC} ] Preparing the autoscript installation ~"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Installation file is ready to begin !"
sleep 2

if [ -f "/usr/local/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi

mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo -e " This Autoscript Is Free [ ${green}Established By Brian 2022${NC} ] "
echo -e ""
echo -e " ${green}Please Insert Your Name${NC}"
echo -e ""
read -p " Client Name : " user
echo -e ""
echo "$user" >> /root/user
clear
echo -e " This Autoscript Is Free [ ${green}Established By Brian 2022${NC} ] "
echo -e ""
echo -e " ${green}Please Insert Domain${NC}"
echo -e ""
read -p " Hostname / Domain: " host
echo -e ""
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /root/domain
clear
echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
echo -e ""
sleep 1
#Install Dependencies
echo -e "\e[0;32mINSTALLING TOOLS...\e[0m"
sleep 1
wget -q https://raw.githubusercontent.com/brianxkl/autoscript/main/SETUP/tools.sh && chmod +x tools.sh && ./tools.sh
rm tools.sh
echo -e "\e[0;32mDONE INSTALLING TOOLS\e[0m"
echo -e ""
sleep 1
clear
sleep 1
#Install SSH-VPN
echo -e "\e[0;32mINSTALLING SSH-VPN...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/brianxkl/autoscript/main/SETUP/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
echo -e "\e[0;32mDONE INSTALLING SSH-VPN\e[0m"
echo -e ""
sleep 1
#Install Xray
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/brianxkl/autoscript/main/SETUP/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/brianxkl/autoscript/main/SSHWS/ins-sshws.sh && chmod +x ins-sshws.sh && ./ins-sshws.sh
echo -e "\e[0;32mDONE INSTALLING XRAY CORE\e[0m"
echo -e ""
sleep 1
clear
#Install SET-BR
echo -e "\e[0;32mINSTALLING SET-BR...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/brianxkl/autoscript/main/SETUP/set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo -e "\e[0;32mDONE INSTALLING SET-BR...\e[0m"
echo -e ""
sleep 1
clear

#finish
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/ssh-vpn.sh

# move client name to xray folder
mv /root/user /usr/local/etc/xray/

if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi

# Version
echo "1.0" > /home/ver
clear
echo ""
echo ""
echo -e "    .-------------------------------------------."
echo -e "    |      Installation Has Been Completed      |"
echo -e "    '-------------------------------------------'"
echo ""
echo ""
echo -e "${purple}═════════════════════${NC}[-Autoscript-Lite-]${purple}═════════════════════${NC}" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    >>> Service Details <<<"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ OVPN & SSH iNFORMATION ]" | tee -a log-install.txt
echo -e "${purple}    --------------------------${NC}" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - Stunnel4                : 447, 777" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ XRAY INFORMATION ]" | tee -a log-install.txt
echo -e "${purple}   --------------------${NC}" | tee -a log-install.txt
echo "   - XRAY VMESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN WS TLS      : 443"  | tee -a log-install.txt
echo "   - XRAY VMESS WS None TLS  : 80"  | tee -a log-install.txt
echo "   - XRAY VLESS WS None TLS  : 80"  | tee -a log-install.txt
echo "   - XRAY TROJAN WS None TLS : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ YAML INFORMATION ]" | tee -a log-install.txt
echo -e "${purple}   --------------------${NC}" | tee -a log-install.txt
echo "   - YAML XRAY VMESS WS"  | tee -a log-install.txt
echo "   - YAML XRAY VLESS WS"  | tee -a log-install.txt
echo "   - YAML XRAY TROJAN WS"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ SERVER INFORMATION ]"  | tee -a log-install.txt
echo -e "${purple}   ----------------------${NC}" | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPV6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 06.00 GMT +8" | tee -a log-install.txt
echo "   - Backup VPS Data" | tee -a log-install.txt
echo "   - Restore VPS Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   [ DEV INFORMATION ]" | tee -a log-install.txt
echo -e "${purple}   -------------------${NC}" | tee -a log-install.txt
echo "   - Autoscript-Lite By      : Brian"  | tee -a log-install.txt
echo "   - Telegram                : t.me/brianxkl"  | tee -a log-install.txt
echo "   - Github                  : github.com/Brian"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "${purple}════════════════${NC}Autoscript-Lite By Brian${purple}════════════════${NC}" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo ""
echo -e "VPS Will Reboot . . ."
sleep 3
rm -r setup-lite.sh
reboot
