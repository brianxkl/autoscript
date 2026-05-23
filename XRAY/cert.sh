#!/bin/bash
#Autoscript-Lite By Brian
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
source /var/lib/premium-script/ipvps.conf
domain=$(cat /usr/local/etc/xray/domain)
clear
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 0.5
systemctl stop nginx
systemctl stop xray.service
systemctl stop xray@none.service
systemctl stop xray@vless.service
systemctl stop xray@vnone.service
systemctl stop xray@trojanws.service
systemctl stop xray@trnone.service
systemctl stop ws-dropbear.service
systemctl stop ws-stunnel.service
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
rm -r /root/.acme.sh
sleep 2
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /usr/local/etc/xray/domain
systemctl restart nginx
systemctl restart xray.service
systemctl restart xray@none.service
systemctl restart xray@vless.service
systemctl restart xray@vnone.service
systemctl restart xray@trojanws.service
systemctl restart xray@trnone.service
systemctl restart ws-dropbear.service
systemctl restart ws-stunnel.service
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
clear
echo ""