#!/bin/bash

echo
echo '------------------------'
echo '     MENÚ PRINCIPAL     '
echo '------------------------'
echo 
echo '1.- Poner Información'
echo '2.- Quitar Información'
echo '3.- Obtener Información'
echo '4.- Información'
echo '5.- Salir'
echo
read -p 'Introduzca una opción: ' opcion
echo

#-------------------  Opcion 5 --------------------------------------------------

if [ $opcion -eq 5 ]; then
    exit

#-------------------  Opcion 1 --------------------------------------------------

elif [ $opcion -eq 1 ]; then
    echo '-----------------'
    echo "Poner Información"
    echo '-----------------'
    echo 
    echo '-----------------------------------------------------------------------------------------'
    read -p 'Escribe el nombre del archivo al cual deceas poner información  ' archivo_a_poner_informacion
    echo '-----------------------------------------------------------------------------------------'
    read -p 'Escribe el nombre del archivo de donde quieres seleccionar la información  ' archivo_con_la_informacion
    echo '-----------------------------------------------------------------------------------------'
    echo
    echo '¿Qué información quieres poner?'
    echo
    echo '1.- Poner metainformación (##) y encabezados (#)'
    echo '2.- Poner solamente metainformación (##)'
    echo '3.- Poner solamente encabezados (#)'
    echo '4.- Sustituir únicamente la metainformación (##)'
    echo '5.- Sustituir únicamente el encabezado (#)'
    echo
    read -p 'Introduce una opción  ' informacion_a_poner
    echo
    echo '-----------------------------------------------------------------------------------------'
    echo
    echo '¿Quieres remplazar el archivo?'
    echo
    echo '1.- Si'
    echo '2.- No'
    echo '3.- Salir del programa'
    echo
    read -p 'Introduce una opción  ' remplazar
    echo
    echo '-----------------------------------------------------------------------------------------'
    if [ $remplazar -eq 1 ]; then
        if [ $informacion_a_poner -eq 1 ]; then
            echo
            echo '--------------------------------------------------------'
            echo "Remplazar archivo, Poner la Metainformación y Encabezado"
            echo '--------------------------------------------------------'
            echo
            Meta_Enca=$(zgrep '#' $archivo_con_la_informacion)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta_Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_a_poner_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_poner -eq 2 ]; then
            echo
            echo '-------------------------------------------'
            echo "Remplazar archivo, Poner la Metainformación"
            echo '-------------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_con_la_informacion)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta_Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_a_poner_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_poner -eq 3 ]; then
            echo
            echo '--------------------------------------'
            echo "Remplazar archivo, Poner el Encabezado"
            echo '--------------------------------------'
            echo
            Meta_Enca=$(zgrep '#' $archivo_con_la_informacion | -n 1)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta_Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_a_poner_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_poner -eq 4 ]; then
            echo
            echo '-----------------------------------------------'
            echo "Remplazar archivo, Sustituir la Metainformación"
            echo '-----------------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_con_la_informacion)
            Enca=$(zgrep '#' $archivo_a_poner_informacion | tail -n 1)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta"$'\n'"$Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_a_poner_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
        elif [ $informacion_a_poner -eq 5 ]; then
            echo
            echo '-----------------------------------------'
            echo "Remplazar archivo, Sustituir el Encabeado"
            echo '-----------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_a_poner_informacion)
            Enca=$(zgrep '#' $archivo_con_la_informacion | tail -n 1)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta"$'\n'"$Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_a_poner_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
        else
            echo
            echo '----------------'
            echo "Opción no valida"
            echo '----------------'
            echo
        fi
    elif [ $remplazar -eq 2 ]; then
        echo
        read -p "Introduce el nombre del archivo de salida:  " nombre_n
        nombre_nuevo="${nombre_n}.vcf"
        echo
        if [ $informacion_a_poner -eq 1 ]; then
            echo
            echo '--------------------------------------------------------------'
            echo "No remplazar archivo, Poner la Metainformación y el Encabezado"
            echo '--------------------------------------------------------------'
            echo
            Meta_Enca=$(zgrep '#' $archivo_con_la_informacion)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta_Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo

        elif [ $informacion_a_poner -eq 2 ]; then
            echo
            echo '----------------------------------------------'
            echo "No remplazar archivo, Poner la Metainformación"
            echo '----------------------------------------------'
            echo
            Meta_Enca=$(zgrep '##' $archivo_con_la_informacion)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta_Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo

        elif [ $informacion_a_poner -eq 3 ]; then
            echo
            echo '-----------------------------------------'
            echo "No remplazar archivo, Poner el Encabezado"
            echo '-----------------------------------------'
            echo
            Meta_Enca=$(zgrep '#' $archivo_con_la_informacion | -n 1)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta_Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo

        elif [ $informacion_a_poner -eq 4 ]; then
            echo
            echo '--------------------------------------------------'
            echo "No remplazar archivo, Sustituir la Metainformación"
            echo '--------------------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_con_la_informacion)
            Enca=$(zgrep '#' $archivo_a_poner_informacion | tail -n 1)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta"$'\n'"$Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'

        elif [ $informacion_a_poner -eq 5 ]; then
            echo
            echo '---------------------------------------------'
            echo "No remplazar archivo, Sustituir el Encabezado"
            echo '---------------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_a_poner_informacion)
            Enca=$(zgrep '#' $archivo_con_la_informacion | tail -n 1)
            Info=$(zgrep -v '#' $archivo_a_poner_informacion)
            Nuevo_vcf="$Meta"$'\n'"$Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
        else
            echo
            echo '----------------'
            echo "Opción no valida"
            echo '----------------'
            echo
        fi
    else
        echo
        echo '----------------'
        echo "Opción no valida"
        echo '----------------'
        echo
    fi


#------------------------ Opcion  2 ----------------------------------------

elif [ $opcion -eq 2 ]; then
    echo '------------------'
    echo "Quitar Información"
    echo '------------------'
    echo 
    echo '-----------------------------------------------------------------------------------------'
    read -p 'Escribe el nombre del archivo al cual deceas quitar información  ' archivo_quitar_informacion
    echo '-----------------------------------------------------------------------------------------'
    echo
    echo '¿Que informacion quieres quitar?'
    echo
    echo '1.- Quitar metainformación (##) y encabezados (#)'
    echo '2.- Quitar solamente metainformación (##)'
    echo '3.- Quitar solamente encabezados (#)'
    echo 
    read -p 'Introduce una opción  ' informacion_a_quitar
    echo 
    echo '-----------------------------------------------------------------------------------------'
    echo
    echo '¿Quieres remplazar el archivo?'
    echo 
    echo '1.- Si'
    echo '2.- No'
    echo '3.- Salir del Programa'
    echo
    read -p 'Introduce una opción  ' remplazar
    echo
    echo '-----------------------------------------------------------------------------------------'

    if [ $remplazar -eq 1 ]; then
        if [ $informacion_a_quitar -eq 1 ]; then
            echo
            echo '----------------------------------------------------------'
            echo "Quitar metainformación, encabezados y Remplazar el Archivo"
            echo '----------------------------------------------------------'
            echo
            Info=$(zgrep -v '#' $archivo_quitar_informacion)
            Nuevo_vcf="$Info"
            echo "$Nuevo_vcf" > "$archivo_quitar_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_quitar -eq 2 ]; then
            echo
            echo '--------------------------------------------'
            echo "Quitar metainformaión y Remplazar el Archivo"
            echo '--------------------------------------------'
            echo
            Enca=$(zgrep '#' $archivo_quitar_informacion | tail -n 1)
            Info=$(zgrep -v '#' $archivo_quitar_informacion)
            Nuevo_vcf="$Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_quitar_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_quitar -eq 3 ]; then
            echo
            echo '-----------------------------------------'
            echo "Quitar encabezados y Remplazar el Archivo"
            echo '-----------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_quitar_informacion)
            Info=$(zgrep -v '#' $archivo_quitar_informacion)
            Nuevo_vcf="$Meta"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$archivo_quitar_informacion"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        else
            echo
            echo '----------------'
            echo "Opción no valida"
            echo '----------------'
            echo
         fi
    elif [ $remplazar -eq 2 ]; then
        echo
        read -p 'Escribe el nombre del archivo nuevo de salida:  ' nombre_n
        nombre_nuevo="${nombre_n}.vcf"
        echo
        echo '-------------------------------------------------------------------------------------'
        echo 
        if [ $informacion_a_quitar -eq 1 ]; then
            echo
            echo '------------------------------------------------------'
            echo "No remplazar, Quitar metainformación y los encabezados"
            echo '------------------------------------------------------'
            echo
            Info=$(zgrep -v '#' $archivo_quitar_informacion)
            Nuevo_vcf="$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_quitar -eq 2 ]; then
            echo
            echo '---------------------------------------'
            echo "No remplazar y quitar la metainformaión"
            echo '---------------------------------------'
            echo
            Enca=$(zgrep '#' $archivo_quitar_informacion | tail -n 1)
            Info=$(zgrep -v '#' $archivo_quitar_informacion)
            Nuevo_vcf="$Enca"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nombre_nuevo"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo
        elif [ $informacion_a_quitar -eq 3 ]; then
            echo
            echo '-------------------------------------'
            echo "No remplazar y quitar los encabezados"
            echo '-------------------------------------'
            echo
            Meta=$(zgrep '##' $archivo_quitar_informacion)
            Info=$(zgrep -v '#' $archivo_quitar_informacion)
            Nuevo_vcf="$Meta"$'\n'"$Info"
            echo "$Nuevo_vcf" > "$nuevo_nombre"
            echo
            echo '----------'
            echo "Completado"
            echo '----------'
            echo 
        else
            echo
            echo '----------------'
            echo "Opción no valida"
            echo '----------------'
            echo
        fi
    elif [ $remplazar -eq 3 ]; then
        exit
    else
        echo
        echo '----------------'
        echo "Opción no valida"
        echo '----------------'
        echo
     fi

#------------------- Opcion 3 -----------------------------------------------------

elif [ $opcion -eq 3 ]; then
    echo
    echo '-------------------'
    echo "Obtener información"
    echo '-------------------'
    echo
    echo '-----------------------------------------------------------------------------------------'
    echo
    read -p 'Escribe el nombre del archivo del que deceas obtener la información:  ' archivo_a_obtener_informacion
    echo
    echo '-----------------------------------------------------------------------------------------'
    echo
    echo "¿Qué información deceas obtener?"
    echo
    echo "1.- Metainformación y Encabezados"
    echo "2.- Metainformación"
    echo "3.- Encabezados"
    echo "4.- Encabezados y Campos de variantes"
    echo "5.- Campos de variantes"
    echo "6.- Salir del Programa"
    echo
    read -p 'Introduce una opción:  ' informacion_a_obtener
    echo
    echo '-----------------------------------------------------------------------------------------'
    echo
    read -p 'Escribe el nombre del archivo donde se va a guarda la información:  ' nombre_nuevo
    echo
    echo '-----------------------------------------------------------------------------------------'
    echo
    archivo_de_salida="${nombre_nuevo}.txt"
    if [ $informacion_a_obtener -eq 1 ]; then
        echo
        echo '-----------------------------'
        echo "Metainformación y Encabezados"
        echo '-----------------------------'
        echo
        Meta=$(zgrep '##' $archivo_a_obtener_informacion)
        Enca=$(zgrep '#' $archivo_a_obtener_informacion | tail -n 1)
        Nuevo_vcf="$Meta"$'\n'"$Enca"
        echo "$Nuevo_vcf" > "$archivo_de_salida"
        echo
        echo '----------'
        echo 'Completado'
        echo '----------'
        echo
    elif [ $informacion_a_obtener -eq 2 ]; then
        echo
        echo '---------------'
        echo "Metainformaicón"
        echo '---------------'
        echo
        Meta=$(zgrep '##' $archivo_a_obtener_informacion)
        Nuevo_vcf="$Meta"
        echo "$Nuevo_vcf" > "$archivo_de_salida"
        echo
        echo '----------'
        echo "Completado"
        echo '----------'
        echo
    elif [ $informacion_a_obtener -eq 3 ]; then
        echo
        echo '-----------'
        echo "Encabezados"
        echo '-----------'
        echo
        Enca=$(zgrep '#' $archivo_a_obtener_informacion | tail -n 1)
        Nuevo_vcf="$Enca"
        echo "$Nuevo_vcf" > "$archivo_de_salida"
        echo
        echo '----------'
        echo "Completado"
        echo '----------'
        echo
    elif [ $informacion_a_obtener -eq 4 ]; then
        echo
        echo '---------------------------------'
        echo "Encabezados y Campos de variantes"
        echo '---------------------------------'
        echo
        Enca=$(zgrep '#' $archivo_a_obtener_informacion | tail -n 1)
        Info=$(zgrep -v '#' $archivo_a_obtener_informacion)
        Nuevo_vcf="$Enca"$'\n'"$Info"
        echo "$Nuevo_vcf" > "$archivo_de_salida"
        echo
        echo '----------'
        echo "Completado"
        echo '----------'
        echo
    elif [ $informacion_a_obtener -eq 5 ]; then
        echo
        echo '-------------------'
        echo "Campos de variantes"
        echo '-------------------'
        echo
        Info=$(zgrep -v '#' $archivo_a_obtener_informacion)
        Nuevo_vcf="$Info"
        echo "$Nuevo_vcf" > "$archivo_de_salida"
        echo
        echo '----------'
        echo "Completado"
        echo '----------'
        echo
    elif [ $informacion_a_obtener -eq 6 ]; then
        exit
    else
        echo
        echo '----------------'
        echo "Opción no valida"
        echo '----------------'
        echo
    fi

#------------------- Opcion 4 -----------------------------------------------------

elif [ $opcion -eq 4 ]; then
    echo '-----------------------------------------------------------------------------------------'
    echo "Información"
    echo 
    echo '-----------------------------------------------------------------------------------------'

#------------------ Opcion No valida ------------------------------------------------------

else
    echo 
    echo '----------------------'
    echo "La opcion no es valida"
    echo '----------------------'
    echo 
fi
