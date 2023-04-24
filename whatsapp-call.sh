#!/bin/bash
sudo apt update -y && apt upgrade -y 
sudo apt install touch -y
 sudo apt install lsof -y
sudo apt install screen -y

sudo wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
sudo touch /etc/rc.local

cat > /etc/rc.local << ENDOFFILE
#!/bin/sh -e
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7313 --max-clients 999
exit 0
ENDOFFILE



chmod +x /etc/rc.local
sudo systemctl restart rc-local.service
sudo chmod +x /usr/bin/badvpn-udpgw
sudo screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7313 --max-clients 999

reboot
