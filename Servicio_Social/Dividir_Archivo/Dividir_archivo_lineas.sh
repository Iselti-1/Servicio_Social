#!/bin/bash

echo
echo '-----------------------------------------------------'
read -p "Introduce el nombre del archivo que quieres dividir:  " archivo
echo '-----------------------------------------------------'
read -p "Introduce el númeron de lineas que quieres que tenga cada parte:  " lineas_por_archivo
prefijo="$archivo.parte_"

#contador para el número de partes
contador=1

num_lineas_archivo=$(cat $archivo | wc -l)

cociente=$((num_lineas_archivo / lineas_por_archivo))
residuo=$((num_lineas_archivo % lineas_por_archivo))

lista=()
for ((i=0; i<=$cociente; i++)); do
    lista+=("$i")
done

for x in ${lista[*]};
do 
    ini=$((x*lineas_por_archivo))
    inicio=$((ini+1))
    a=$((x+1))
    fin=$((lineas_por_archivo*a))
    sed -n "$inicio,$fin"p $archivo > "${prefijo}${contador}.txt"
    contador=$((contador+1))
done

contador=$((contador-1))
con_lin=$(wc -l < "${prefijo}${contador}.txt")
if [[ $con_lin -eq 0 ]]; then
    rm ${prefijo}${contador}.txt
fi    
echo '-----------------------------------------------------'
echo
