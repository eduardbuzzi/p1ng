#!/bin/bash

IP=$(hostname -I | cut -d ' ' -f1 | cut -d '.' -f1-3)
echo
read -p "Quantos IPs você quer varrer na rede? " numeroIPS
test "$numeroIPS" = "0" && numeroIPS=254
test "$numeroIPS" = "" && numeroIPS=254
echo
for x in `seq 1 "$numeroIPS"`; do
PING=$(nmap -sn -T5 $IP.$x | grep "host up")
if [ -n "$PING" ]
then
echo -e "$IP.$x ESTÁ \033[01;32mONLINE\033[01;00m"
else
echo -e "$IP.$x ESTÁ \033[01;31mOFFLINE\033[01;00m"
fi
done
sleep 1
echo "IP(s) ONLINE(s)"
echo
echo "$IPativos"
echo
exit
