#!/bin/bash

#Font colors:
#Black				0;30		Dark Gray			1;30
#Blue					0;34		Light Blue		1;34
#Green				0;32		Light Green		1;32
#Cyan					0;36		Light Cyan		1;36
#Red					0;31		Light Red			1;31
#Purple				0;35		Light Purple	1;35
#Brown/Orange	0;33		Yellow				1;33
#Light Gray		0;37		White					1;37

nc='\e[0m'					# No Color
blue='\e[0;34m'
green='\e[0;32m'
lightred='\e[1;31m'

# --------------------------------------------------------------------------------

echo -e "${lightred}Documentando programa${nc}"
sleep 1
./documentar.sh

# --------------------------------------------------------------------------------

echo -e "${lightred}Preparando para envio${nc}"
sleep 1
./gerarLibArduino.sh

# --------------------------------------------------------------------------------

echo -e "${lightred}Apagando arquivos para envio${nc}"
sleep 1
rm .gitignore

# --------------------------------------------------------------------------------

echo -e "${green}Finalizado${nc}"
sleep 2
exit 0
