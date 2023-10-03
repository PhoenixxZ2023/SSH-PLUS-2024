#!/bin/bash

#install
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/PhoenixxZ2023/SSH-PLUS-2024.git
unzip scupdate/xolpanel.zip
pip3 install -r xolpanel/requirements.txt
pip3 install pillow

#isi data
echo "INSTALL BOT CREATE via TELEGRAM"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain :" domain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/ftvpn/var.txt
echo -e ADMIN='"'$admin'"' >> /root/ftvpn/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/ftvpn/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Api Token     : $bottoken"
echo "ID            : $admin"
echo "DOMAIN        : $domain"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @XolPane
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start xolpanel
systemctl enable xolpanel

clear

echo " Installations complete, type /menu on your bot"
