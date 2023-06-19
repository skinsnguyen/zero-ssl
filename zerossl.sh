#!/bin/bash
## Author : Hoang Nam
## Last Updated : 19/06/2023
## Company : AZDIG
pwdd=`pwd`
cat << "EOF"
 _   _                                          _   _
| \ | | __ _ _   _ _   _  ___ _ __             | \ | | __ _ _ __ ___
|  \| |/ _` | | | | | | |/ _ \ '_ \ _____ _____|  \| |/ _` | '_ ` _ \
| |\  | (_| | |_| | |_| |  __/ | | |_____|_____| |\  | (_| | | | | | |
|_| \_|\__, |\__,_|\__, |\___|_| |_|           |_| \_|\__,_|_| |_| |_|
       |___/       |___/

EOF


echo "! Kich Hoat SSL  !"
read -p "Nhap domain  :" domainssl
read -p "Nhap path  : " pathssl
wget -O -  https://get.acme.sh | sh -s email={domainssl}   
source ~/.bashrc

./acme.sh --issue --webroot ~/${pathssl} -d ${domainssl} -d www.${domainssl} --force
./acme.sh --deploy --deploy-hook cpanel_uapi --domain ${domainssl} --domain www.${domainssl}  
rm -f ${pwdd}/zerossl.sh
