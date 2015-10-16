#! /bin/bash

# Ruta absoluta, e.g. /home/user/bin/foo.sh

the_absolute=$(readlink -f "$0")

# directorio contenedor, e.g /home/user/bin
the_path=$(dirname "$the_absolute")

#Comprobación usuario

the_user=`whoami`

if [ $the_user != "root" ]; then
	printf "Este script debe ejecutarse como root \n"
	exit 1
fi

if [ ! -e kylixlibs3-borqt_3.0-1_i386.deb ]; then
	echo "No se encuentra el paquete kylixlibs3-borqt_3.0-1_i386.deb"
	exit 1
fi

if [ ! -e dbdesigner-4.0.5.6.deb ]; then
        echo "No se encuentra el paquete dbdesigner-4.0.5.6.deb"
        exit 1
fi

dpkg --add-architecture i386 >> $the_path/install.log 2>&1
apt-get update >> $the_path/install.log 2>&1
dpkg -i $the_path/kylixlibs3-borqt_3.0-1_i386.deb >> $the_path/install.log 2>&1
apt-get -f install -y >> $the_path/install.log 2>&1
dpkg -i $the_path/dbdesigner-4.0.5.6.deb >> $the_path/install.log 2>&1
apt-get -f install -y >> $the_path/install.log 2>&1

echo "Instalación completada. Recuerde copiar el fichero DBConn_DefaultSettings.ini en el directorio .DBDesigner4 dentro de su directorio personal una vez ejecutado el software"
