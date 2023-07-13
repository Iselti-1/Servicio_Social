#!/bin/bash

read -p "Introduce el nombre del archivo con la lista de posiciones:  " archivo
read -p "Introduce el nombre del archivo del cual quieres extraer las posiciones:  " archivo_a_filtrar
read -p "Introduce el nombre del archivo donde se gauardan las filas filtradas en la lista:  " nombre_n

nombre_nuevo="${nombre_n}.vcf"
mapfile -t lineas < "$archivo"

for linea in "${lineas[@]}"
do
    awk -v awk_linea=$linea '$2 == awk_linea {print $0}' $archivo_a_filtrar >> "$nombre_nuevo"
done
