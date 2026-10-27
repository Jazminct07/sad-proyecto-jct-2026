#!/usr/bin/env bash
# El script se detiene si hay errores
set -e
export DEBIAN_FRONTEND=noninteractive
echo "########################################"
echo " Aprovisionando adminpc "
echo "########################################"
apt-get update -y
apt-get install -y curl nmap tcpdump wget iputils-ping

# Usuario administrador (en Debian el grupo de administradores es "sudo", no "wheel")
echo "=> Creamos usuario administrador..."
id admin_jazmin >/dev/null 2>&1 || useradd -m -s /bin/bash admin_jazmin
usermod -aG sudo admin_jazmin
echo "admin_jazmin ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/admin_jazmin
chmod 440 /etc/sudoers.d/admin_jazmin

# Claves SSH inyectadas por Vagrant en /tmp
echo "=> Importamos claves SSH"
mkdir -p /home/admin_jazmin/.ssh
cp /tmp/id_ed25519 /home/admin_jazmin/.ssh/id_ed25519
cp /tmp/id_ed25519.pub /home/admin_jazmin/.ssh/id_ed25519.pub
# Por si las claves vienen de Windows con finales de línea CRLF
sed -i 's/\r$//' /home/admin_jazmin/.ssh/id_ed25519 /home/admin_jazmin/.ssh/id_ed25519.pub

chown -R admin_jazmin:admin_jazmin /home/admin_jazmin/.ssh
chmod 700 /home/admin_jazmin/.ssh
chmod 600 /home/admin_jazmin/.ssh/id_ed25519
chmod 644 /home/admin_jazmin/.ssh/id_ed25519.pub

echo "------ FIN ------"

