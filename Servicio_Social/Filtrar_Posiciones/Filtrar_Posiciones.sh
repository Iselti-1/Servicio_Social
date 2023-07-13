#!/bin/bash

echo
echo '-----------------------------------------------------'
read -p "Introduce el nombre del archivo con la lista de posiciones:  " Lista
echo '-----------------------------------------------------'
echo 'Utiliza un archivo solo con la información de las variantes'
echo 'Es decir sin metainformacion ni encabezados'
read -p "Introduce el nombre del archivo del cual quieres extraer las posiciones:  " archivo_a_filtrar

mapfile -t lista < "$Lista" # Guardamos cada posicion en una lista

Lista_pos=$(awk '{print $2}' $archivo_a_filtrar | tr '\n' ' ') # guardamos en una variable las posiciones de nuestra informacion
IFS=" " read -ra Lista_posiciones <<< "$Lista_pos" # combertimos en una lista las posiciones de nuestra informacion

encontrado=0 # Una variable que nos indica si se encuentra la posicion en la lista de posiciones de nuetra informacion

for pos in "${Lista_posiciones[@]}"; do 
    for elemento in "${lista[@]}"; do
        if [[ $elemento -eq $pos ]]; then
            encontrado=1
            awk -v awk_pos=$pos '$2 == awk_pos {print $0}' $archivo_a_filtrar >> Posiciones_encontradas_desordenadas.tsv
        fi
    done
    if [[ $encontrado -eq 0 ]]; then
        awk -v awk_pos=$pos '$2 == awk_pos {print $0}' $archivo_a_filtrar >> Posiciones_no_encontradas_desordenadas.tsv
    fi
    encontrado=0
done

sort -k2 Posiciones_encontradas_desordenadas.tsv | uniq >> Posiciones_encontradas.tsv
sort -k2 Posiciones_no_encontradas_desordenadas.tsv | uniq >> Posiciones_no_encontradas.tsv
rm Posiciones_no_encontradas_desordenadas.tsv 
rm Posiciones_encontradas_desordenadas.tsv 

echo '-----------------------------------------------------'
echo
