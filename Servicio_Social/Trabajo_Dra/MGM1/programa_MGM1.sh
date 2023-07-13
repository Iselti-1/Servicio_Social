#!/bin/bash

#Convertimos las filas del archivo .fam en archivos individuales
#------------------------------------------
lineas=""
contador=1
prefijo="MGM1_"

while IFS= read -r linea; do
    lineas+="$linea"
    num_lineas=$(echo "$lineas" | wc -l)

    if [[ $num_lineas -eq 1 ]]; then
        archivo_salida="${prefijo}${contador}"

        printf "%s" "$lineas" > "$archivo_salida"

        ((contador += 1))
        lineas=""
    fi
done < MGM1.fam
#------------------------------------------

#Extraemos cada individuo y generamos sus archivos bim/bed/fam
for x in {1..48};do plink --bfile MGM1 --keep MGM1_$x --make-bed --out MGM1_$x ; done

#------------------------------------------

#Identificamos información faltante por individuo

for x in {1..48};do plink --bfile MGM1_$x --missing --out MGM1_$x; done
#------------------------------------------

#Utilizamos awk para identificar los individuos a remover

for x in {1..48}; do awk '$3 == 1 || $1 == 0 || $1 == 23 || $1 == 24 || $1 == 25' MGM1_$x.lmiss | awk '{print $2}' > MGM1_rs_$x; done

#------------------------------------------

#Removemos los individuos y creamos sus archivos bim/bed/fam

for x in {1..48};do plink --bfile MGM1_$x --exclude MGM1_rs_$x --make-bed --out MGM1_clean_$x; done

#------------------------------------------

#Creamos una carpeta llamada MGM1_Clean y guardamos los archivos bim/bed/fam ya limpios en esta carpeta

mkdir MGM1_clean

for x in {1..48};do mv MGM1_clean_$x.bed MGM1_clean;done
for x in {1..48};do mv MGM1_clean_$x.bim MGM1_clean;done
for x in {1..48};do mv MGM1_clean_$x.fam MGM1_clean;done

