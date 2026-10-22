#!/bin/bash

# 1. Crear el usuario administrador local en adminpc (Alpine)
echo "=> Creando usuario administrador..."
adduser -D admin_jazmin
adduser admin_jazmin wheel
echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
echo "=> Importando claves SSH desde el anfitrión..."

# 2. Movemos las llaves inyectadas por Vagrant en /tmp
mkdir -p /home/admin_jazmin/.ssh
mv /tmp/id_ed25519 /home/admin_jazmin/.ssh/id_ed25519
mv /tmp/id_ed25519.pub /home/admin_jazmin/.ssh/id_ed25519.pub

# Limpiar posibles retornos de carro de Windows (CRLF)
sed -i 's/\r$//' /home/admin_jazmin/.ssh/id_ed25519

# 3. Ajustamos los permisos por seguridad
chown -R admin_jazmin:admin_jazmin /home/admin_jazmin/.ssh
chmod 700 /home/admin_jazmin/.ssh
chmod 600 /home/admin_jazmin/.ssh/id_ed25519
chmod 644 /home/admin_jazmin/.ssh/id_ed25519.pub

