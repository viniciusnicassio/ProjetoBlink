#!/bin/bash

NC='\e[0m' # No Color
blue='\e[0;34m'
green='\e[0;32m'
lightred='\e[1;31m'

#Font colors:
#Black				0;30		Dark Gray			1;30
#Blue					0;34		Light Blue		1;34
#Green				0;32		Light Green		1;32
#Cyan					0;36		Light Cyan		1;36
#Red					0;31		Light Red			1;31
#Purple				0;35		Light Purple	1;35
#Brown/Orange	0;33		Yellow				1;33
#Light Gray		0;37		White					1;37

echo -e "${lightred}Executando doxygen${NC}"
sleep 1
rm -r latex/
doxygen doxyfile
mkdir docs

# --------------------------------------------------------------------------------

echo -e "${lightred}Editando refman.tex${NC}"
sleep 1
cd latex/

echo -e "${blue}	Corrigindo para portugues${NC}"
sleep 1
sed -i "s|Portuguese|\\\usepackage[portuguese]{babel}|g" refman.tex

echo -e "${blue}	Corrigindo espaços de capítulo${NC}"
sleep 1
sed -i "s|\\\section{|\n\\\newpage\n\\\section{|g" refman.tex

# --------------------------------------------------------------------------------

echo -e "${lightred}Executando Makefile${NC}"
sleep 1
make all

# --------------------------------------------------------------------------------

echo -e "${lightred}Movendo para a pasta${NC}"
sleep 1
cd ..
cp ./latex/refman.pdf ./docs/doc.pdf
rm -r ./latex/

# --------------------------------------------------------------------------------

echo -e "${green}Finalizado${NC}"
sleep 2
exit 0
