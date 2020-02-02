#!/bin/bash

IP=$(hostname -I | cut -d ' ' -f1 | cut -d '.' -f1-3)
dia=$(date +%d)
mes=$(date +%m)
ano=$(date +%Y)
hora=$(date +%H)
minuto=$(date +%M)

echo
read -p "Quantos IPs você quer varrer na rede? " numeroIPS
test "$numeroIPS" = "0" && numeroIPS=254
test "$numeroIPS" = "" && numeroIPS=254
echo
for x in  `seq 1 "$numeroIPS"`; do
PING=$(ping -c 1 "$IP.$x" | grep "64 bytes" | cut -d' ' -f4 | sed 's/.$//')
if [ "$PING" == "$IP.$x" ]; then
echo -e "$IP.$x ESTÁ \033[01;32mONLINE\033[01;00m"
echo "$IP.$x" >> "$dia$mes$ano-$hora-$minuto-ativo"
else
echo -e "$IP.$x ESTÁ \033[01;31mOFFLINE\033[01;00m"
echo "$IP.$x" >> "$dia$mes$ano-$hora-$minuto-inativo"
fi
done
IPativos=$(cat "$dia$mes$ano-$hora-$minuto-ativo")
IPinativos=$(cat "$dia$mes$ano-$hora-$minuto-inativo")
sleep 1
echo
echo
echo "IP(s) OFFLINE(s)"
echo
echo "$IPinativos"
echo
echo "IP(s) ONLINE(s)"
echo
echo "$IPativos"
echo
read -p "Nome do arquivo que deseja salvar o log do Ping: " arquivo
conteudoArquivo=$(echo -e "\n$dia $mes $ano $hora:$minuto \n\nIP(s) ATIVO(s)\n\n$IPativos \n\n----------------\n\nIP(s) INATIVO(s)\n\n$IPinativos \n" >> "$arquivo")
echo "$conteudoArquivo"
rm "$dia$mes$ano-$hora-$minuto-ativo"
rm "$dia$mes$ano-$hora-$minuto-inativo"
exit
