sudo apt update -y && apt upgrade -y 
sudo apt install touch
sudo apt install screen 
sudo apt install lsof

sudo wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/daybreakersx/premscript/master/badvpn-udpgw64"
sudo touch /etc/rc.local
sudo nano /etc/rc.local

----------------------
#!/bin/sh -e
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7333
exit 0
----------------------

chmod +x /etc/rc.local
sudo systemctl status rc-local.service
sudo chmod +x /usr/bin/badvpn-udpgw
sudo screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7333
reboot