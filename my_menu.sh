#!/bin/bash

function FISIERE {
    echo "Introdu calea fisierului (cale absoluta):"
    read -p "Nume fisier: " nume_fisier

    if [ -e "$nume_fisier" ]; then
        while true; do
            echo "1. Deschide"
            echo "2. Sterge"
            echo "3. Muta/Redenumește"
            echo "4. Modifică Permisiunile"
            echo "5. Verifică Permisiunile"
            echo "Ce operație vrei să faci?"
            read -p "Alege: " input_utilizator

            case $input_utilizator in
                1)
                        cat "$nume_fisier"
                        ;;

                2)
                        rm "$nume_fisier"
                        FISIERE
                        ;;

                3)
                        read -p "Care este destinația? (cale absoluta): " destinatie
                        mv "$nume_fisier" "$destinatie"
                        ;;

                4)
                        read -p "Ce permisiuni vrei să setezi pentru fisier? (ex: 754 pentru rwxr-xr--): " permisiune
                        chmod "$permisiune" "$nume_fisier"
                        ;;

                5) 
                        ls -l "$nume_fisier"
                        ;;

                *)
                        break
                        ;;
            esac
        done
    else
        echo "Fisierul $nume_fisier nu exista."
    fi
}

function Directoare {
    echo "Introdu calea directorului (cale absoluta):"
    read -p "Nume director: " nume_director

    if [ -e "$nume_director" ]; then
        while true; do
            echo "1. Deschide"
            echo "2. Sterge"
            echo "3. Muta/Redenumește"
            echo "4. Modifică Permisiunile"
            echo "5. Verifică Permisiunile"
            echo "Ce operație vrei să faci?"
            read -p "Alege: " input_utilizator

            case $input_utilizator in
                1)
                        ls "$nume_director"
                        ;;
                2)
                        rm -rf "$nume_director"
                        Directoare
                        ;;
                3)
                        read -p "Care este destinația? (cale absoluta): " destinatie
                        mv "$nume_director" "$destinatie"
                         "";;
                4)
                        read -p "Ce permisiuni vrei să setezi pentru director? (ex: 754 pentru rwxr-xr--): " permisiune
                        chmod "$permisiune" "$nume_director"
                        ;;
                5)
                        ls -l "$nume_director"
                        ;;
                *)
                        break
                        ;;
            esac
        done
    else
        echo "Directorul $nume_director nu exista."
    fi
}

function meniu_task5 {
    echo "Cu ce vrei să lucrezi?"
    echo "1. FISIERE"
    echo "2. Directoare"
    read -p "Alege: " optiune

    case $optiune in
        1) FISIERE ;;
        2) Directoare ;;
        *) break ;;
    esac
}

meniu_task5
