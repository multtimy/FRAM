#!/bin/bash

#Colores
V="\e[01;32m"; A="\e[01;33m"; R="\e[01;31m"; B="\e[01;34m"; X="\e[00m"
#Funcion que libera memoria ram con un while
function fram() {
	local x=1
	while [ ${x} -le 6 ]; do
	      echo -e "${V}.\c${X}"
	      sudo sync; sudo sysctl -w vm.drop_caches=3 2&>/dev/null
	      x=$[${x}+1]
	done
	echo ""
}
#Funcion Principal
test_ram=$(free -mh | grep 'Mem' | cut -c 38-46)
echo -e "${A}Liberando Memoria ${R}RAM${V}.${X}\c";fram
echo -e "${R}RAM ${A}actual ${B}-> ${V}${test_ram}${X}"

