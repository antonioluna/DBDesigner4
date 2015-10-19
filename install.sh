#! /bin/bash

printf "\n%s\n\n" 'Script de instalción de DBDesigner4 en Debian 8.2 "Jessie"'

if (( $(id -u) != 0 )); then
	printf "\n%s\n\n" "Este script debe ejecutarse como root"
	exit 1
fi

if [[ "$( uname -v | cut -d " " -f 3 )" != "Debian" ]] && [[ "$( uname -m )" != "x86_64" ]]; then

	printf "\n%s\n\n" "Este escript está diseñado para sistemas operativos Debian x86_64"
	exit 1
fi

if [[ ! -e kylixlibs3-borqt_3.0-1_i386.deb ]]; then
	printf "\n%s\n\n" "No se encuentra el paquete kylixlibs3-borqt_3.0-1_i386.deb"
	exit 1
else
	printf "\n%s\n\n" "Instalando kylixlibs3-borqt_3.0-1_i386.deb"
	sleep 3
	dpkg --add-architecture i386 || exit 1
	apt-get update && dpkg -i kylixlibs3-borqt_3.0-1_i386.deb
	printf "\n%s\n\n" "Corrigiendo dependencias de kylixlibs3-borqt_3.0-1_i386.deb"
	sleep 3
	apt-get -f install || exit 1
fi

if [[ ! -e dbdesigner-4.0.5.6.deb ]]; then
	printf "\n%s\n\n" "No se encuentra el paquete dbdesigner-4.0.5.6.deb"
	exit 1
else
	printf "\n%s\n\n" "Instalando dbdesigner-4.0.5.6.deb"
	sleep 3
	dpkg -i dbdesigner-4.0.5.6.deb
	printf "\n%s\n\n" "Corrigiendo dependencias de dbdesigner-4.0.5.6.deb"
	sleep 3
	apt-get -f install || exit 1
fi

printf "\n%s\n\n" "Instalación completada."