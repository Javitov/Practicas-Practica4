#!/bin/bash


usuario=$( whoami )
cat paquetes.txt | tr -s ':' ' ' > packtemp.txt


i=0
while read paquete action
do
    paquetes[$i]="$paquete"
    acciones[$i]="$action"
    ((i++))
        
done < packtemp.txt



function borrarPaquete(){
    paquete=$( echo ${paquetes[$b]})
    if [[ $instalado -gt 0  ]];
    then
        sudo apt remove $paquete -y
    else
        echo El paquete $paquete no está instalado
    fi
}

function instalarPaquete(){
    paquete=$( echo ${paquetes[$b]})
    if [[ $instalado -eq 0  ]] ;
    then
        sudo apt install $paquete -y &> /dev/null
    else
        echo El paquete $paquete ya está instalado
    fi

}

function statusPaquete(){
    paquete=$( echo ${paquetes[$b]})
    if [[ $instalado -eq 0  ]] ;
    then
        echo El paquete $paquete NO está instalado
    else
        echo El paquete $paquete está instalado
    fi
}

function accionPaquete(){
    for (( b=0; b <$i; b++ ))
    do
        accion=$( echo ${acciones[$b]})
        paquete=$( echo ${paquetes[$b]})
        instalado=$( whereis $paquete | grep bin | wc -l )
        case $accion in
            "add"*)
                instalarPaquete "${paquetes[@]}" $instalado
            ;;
            "remove"*)
                borrarPaquete "${paquetes[@]}" $instalado
            ;;
            "status"*)
                statusPaquete "${paquetes[@]}" $instalado
            ;;
            *)
                exit
            ;;
            
        esac
    done
}


if [[ ${usuario} = "root" ]] ;
then
    echo Se van actualizar las paqueterías:
    sudo apt update &> /dev/null
    echo Se cargan los datos:
    #leerDatos
    echo Se van a realizar las acciones
    for (( b=0; b <$i; b++ ))
    do
        accionPaquete "${paquetes[@]}" "${acciones[@]}"
    done
else
    echo ERROR: El usuario tiene que ser root
fi

