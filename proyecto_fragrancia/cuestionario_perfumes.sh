#!/bin/bash


# Definir colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AZUL='\033[0;34m'
AMARILLO='\033[1;33m'
RESET='\033[0m' # Para volver al color normal

# Cabecera con ASCII Art
clear
echo -e "${AZUL}"
echo "  _____  ______ _____  ______ _    _ __  __ ______ "
echo " |  __ \|  ____|  __ \|  ____| |  | |  \/  |  ____|"
echo " | |__) | |__  | |__) | |__  | |  | | \  / | |__   "
echo " |  ___/|  __| |  _  /|  __| | |  | | |\/| |  __|  "
echo " | |    | |____| | \ \| |    | |__| | |  | | |____ "
echo " |_|    |______|_|  \_\_|     \____/|_|  |_|______|"
echo -e "${RESET}"
echo -e "${AMARILLO}     >>> BIENVENIDO AL ASESOR DE FRAGANCIAS <<<${RESET}"
echo ""

estilos=("Dulces" "Especiados" "Amaderados" "Caros" "Baratos")
archivos=("dulces.txt" "especiados.txt" "amaderados.txt" "caros.txt" "baratos.txt")

echo "----- TU PERFUME PERFECTO -----"
read -p "Primero de todo, necesito saber tu edad. ¿Cuántos años tienes?: " edad_usuario


olores_perfume(){
    echo ""
    echo "Seleccione una categoría de la lista: "

    #iteramos soble el array para mostrar las opciones numeradas

    for i in "${!estilos[@]}"; do
        echo "$((i+1)). ${estilos[$i]}"
    done
}

#preguntamos al usuario su edad, si es menor a 18 años, recomendamos perfumes juveniles.

if [[ ! $edad_usuario =~ ^[0-9]+$ ]]; then
    echo "Introduce una edad válida, por favor"
    exit 1
elif [[ $edad_usuario -le 18 ]]; then
    echo ""
    echo "Debido a que eres una persona joven, te recomendamos estos perfumes: "
    echo "---------------------------------------------------------------------"
    echo ""
    cat jovenes.txt
else
    olores_perfume
    echo ""
    read -p "¿Qué tipo de olor te gusta para un perfume?: " olor_usuario
    if [[ $olor_usuario -ge 1 && $olor_usuario -le "${#estilos[@]}" ]]; then
        indice=$((olor_usuario - 1))
        estilo_seleccionado="${estilos[$indice]}"
        archivo_seleccionado="${archivos[$indice]}"

        echo ""
        echo ">> 👃Estilo: **$estilo_seleccionado**"

        echo ""
        echo "Para afinar la recomendación, ¿en qué temporada piensas usarlo principalmente?"
        echo "1) ☀️ Verano / Calor"
        echo "2) ❄️ Invierno / Frío"
        echo "3) 🍂 Otoño / Primavera"
        echo "4) 🏢 Diario / Oficina"
        echo "5) 🍷 Cita romántica"
        echo "6) 🎉 Fiesta / Discoteca / Noche"
        echo "7) 🏋️ Gimnasio / Deporte"

        read -p "Elige una opción (1-7): " temporada

        echo ""
        echo "--- 💡 CONSEJOS DE USO ---"
        case $temporada in
            1)
                echo "☀️  CONTEXTO CALOR: Ten cuidado."
                echo "    El calor 'evapora' el perfume rápido y lo hace muy intenso."
                echo "    Si usas perfumes $estilo_seleccionado, aplica pocos sprays (máximo 3)."
                ;;
            2)
                echo "❄️  CONTEXTO FRÍO: Es el mejor momento para los perfumes $estilo_seleccionado."
                echo "    El frío 'apaga' el olor, así que puedes ser generoso con los sprays."
                echo "    Aplícalo en bufandas o abrigos para que dure días."
                ;;
            3)
                echo "🍂  CONTEXTO TEMPLADO: Es el clima perfecto."
                echo "    No necesitas trucos especiales. Los perfumes $estilo_seleccionado"
                echo "    se comportarán de manera equilibrada y natural."
                ;;
            4)
                echo "💼  CONTEXTO FORMAL: Menos es más."
                echo "    No quieres ser 'esa persona' que marea a los compañeros."
                echo "    Aplica solo en la piel (cuello), nunca en la ropa."
                ;;
            5)
                echo "🍷  CONTEXTO CITA: El objetivo es que te huelan al acercarse."
                echo "    No uses demasiada cantidad. Aplica detrás de las orejas"
                echo "    y en la nuca para invitar a la cercanía."
                ;;
            6)
                echo "🎉  CONTEXTO FIESTA: Aquí necesitas potencia."
                echo "    Hay muchos olores en el ambiente (humo, gente, bebidas)."
                echo "    Necesitas 'proyección': aplica 5-6 sprays y reaplica cada 4 horas."
                ;;
            7)
                echo "🏋️  CONTEXTO DEPORTE: ¡Cuidado!"
                echo "    Si el perfume es muy dulce o especiado, puedes marearte al subir pulsaciones."
                echo "    Te recomendamos usar muy poca cantidad o elegir algo más cítrico."
                ;;
            *)
                echo "🤔  Opción general: Disfruta tu fragancia con moderación."
                ;;
        esac
        echo "---------------------------------------------------"
        echo "Aquí tienes tus recomendaciones de perfumes $estilo_seleccionado:"
        echo ""
        if [ -f "$archivo_seleccionado" ]; then
            cat "$archivo_seleccionado"
        else
            echo "Error: No encuentro el archivo $archivo_seleccionado"
        fi
        echo "---------------------------------------------------"

    else
        echo "❌ Opción no válida. Por favor selecciona un número del menú."
    fi
fi
