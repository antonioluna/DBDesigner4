#Autoinstalador para DBDesigner4 en Debian 8.2 "Jessie"

###Pasos a seguir:

1. Dar permisos de ejecución al fichero "install.sh"
 * chmod +x install.sh
2. ejecutar el script como root:
 * bash install.sh

##Updates

 * Mejoras en los scripts de instalación, post-instalación y purga.
 * Ya no es necesario copiar el fichero DBConn_DefaultSettings.ini a la carpeta personal
 
#UPDATE IMPORTANTE

* Corregida dependencia que podía provocar la desinstalación de varios paquetes importantes en 64 bits.
