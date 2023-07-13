#!/bin/bash

Lista="Lista_chr_22.tsv"
archivo_a_filtrar="200_filas.tsv"

mapfile -t lista < "$Lista"

Lista_pos=$(awk '{print $2}' $archivo_a_filtrar | tr '\n' ' ')
IFS=" " read -ra Lista_pos_200 <<< "$Lista_pos"
#unset Lista_pos_200[0]
#echo ${#Lista_pos_200[@]}

encontrado=0

for pos in "${Lista_pos_200[@]}"; do
    for elemento in "${lista[@]}"; do
        if [[ $elemento -eq $pos ]]; then
            encontrado=1
            echo "$pos" >> Posiciones_encontradas.tsv
        fi
    done
    if [[ $encontrado -eq 0 ]]; then
        awk -v awk_pos=$pos '$2 == awk_pos {print $0}' $archivo_a_filtrar >> Posiciones_no_encontradas.tsv
        echo "$pos" >> Posiciones_no_encontradas_posicion.tsv
    fi
    encontrado=0
done

