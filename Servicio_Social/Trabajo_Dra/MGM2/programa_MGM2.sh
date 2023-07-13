#!/bin/bash

#Convertimos las filas del archivo .fam en archivos individuales
#------------------------------------------
lineas=""
contador=1
prefijo="MGM2_"

while IFS= read -r linea; do
    lineas+="$linea"
    num_lineas=$(echo "$lineas" | wc -l)

    if [[ $num_lineas -eq 1 ]]; then
        archivo_salida="${prefijo}${contador}"

        printf "%s" "$lineas" > "$archivo_salida"

        ((contador += 1))
        lineas=""
    fi
done < MGM2.fam
#------------------------------------------

#Extraemos cada individuo y generamos su archivos bim/bed/fam
for x in {1..48};do plink --bfile MGM2 --keep MGM2_$x --make-bed --out MGM2_$x ; done

#------------------------------------------

#Identificamos información faltante por individuo

for x in {1..48};do plink --bfile MGM2_$x --missing --out MGM2_$x; done
#------------------------------------------

#Utilizamos awk para identificar los individuos a remover

for x in {1..48}; do awk '$3 == 1 || $1 == 0 || $1 == 23 || $1 == 24 || $1 == 25' MGM2_$x.lmiss | awk '{print $2}' > MGM2_rs_$x; done

#------------------------------------------

#Removemos los individuos y creamos archivos bim/bed/fam

for x in {1..48};do plink --bfile MGM2_$x --exclude MGM2_rs_$x --make-bed --out MGM2_clean_$x; done

#------------------------------------------

#Creamos una carpeta llamada MGM2_clean y guardamos los archivos bim/bed/fam ya limpios en esta carpeta

mkdir MGM2_clean

for x in {1..48};do mv MGM2_clean_$x.bed MGM2_clean;done
for x in {1..48};do mv MGM2_clean_$x.bim MGM2_clean;done
for x in {1..48};do mv MGM2_clean_$x.fam MGM2_clean;done

