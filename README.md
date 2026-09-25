# Proyecto SAD
![alt text](image.png)

## 1. Gateway y Enrutador (gw)
* SO: Ubuntu 24.04
*  Hostname: gw-jct
* Interfaces de red:
  * ethe (NAT): Salida a Internet básica (Vagrant por defecto).
  * eth1 (Bridge): Conexión puente a la red fisica del aula (para Site-to-Site VPN). IP asignada por el instituto.
  * eth2 (DMZ): 172.1.2.1
  * eth3 (Empleados): 172.2.2.1
  * eth4 (Gestión): 172.3.2.1
  
