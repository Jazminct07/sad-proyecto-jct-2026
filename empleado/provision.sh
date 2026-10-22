#!/bin/sh

# El script se detiene si hay errores
set -e
echo "########################################"
echo " Aprovisionando cliente "
echo "########################################"
echo "-----------------"
echo "Actualizando repositorios"
apk update
apk add curl nmap tcpdump wget bash iputils

apt-get update
apt-get install -y curl nmap

echo "------ FIN ------"
