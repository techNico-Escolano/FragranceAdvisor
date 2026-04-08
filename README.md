# 🧴 FragrancIA

¡Bienvenido al **Asesor de Fragancias**! Este es un script interactivo desarrollado íntegramente en **Bash** que funciona como un consultor personal de perfumes directamente en tu terminal.

El programa te guía a través de un cuestionario interactivo para recomendarte la fragancia perfecta según tu edad, tus gustos olfativos y la ocasión o temporada en la que planeas usarla.

## ✨ Características Principales

* **Interfaz visual en consola:** Cuenta con una cabecera en arte ASCII y uso de códigos de escape ANSI para dar formato y color al texto, mejorando la experiencia del usuario.
* **Filtro de Edad:** Lógica condicional que detecta si el usuario es menor de 18 años para recomendarle automáticamente una selección de perfumes juveniles.
* **Consejos de Uso Dinámicos (Contexto):** Dependiendo de la situación (cita, gimnasio, oficina, fiesta, frío o calor), el script te da consejos reales sobre cuántos *sprays* usar y cómo se comportará el perfume.
* **Base de Datos Modular:** Las recomendaciones no están incrustadas en el código (`hardcoded`), sino que el script lee dinámicamente desde archivos `.txt` externos (`dulces.txt`, `amaderados.txt`, etc.), lo que hace que añadir nuevos perfumes sea extremadamente fácil.

## 📁 Estructura del Proyecto

Para que el script funcione correctamente, todos estos archivos deben estar en el mismo directorio:

```text
Asesor_Fragancias/
├── cuestionario_perfumes.sh  # Script principal
├── amaderados.txt            # Base de datos de amaderados
├── baratos.txt               # Base de datos de perfumes económicos
├── caros.txt                 # Base de datos de perfumes nicho/lujo
├── dulces.txt                # Base de datos de perfumes dulces
├── especiados.txt            # Base de datos de perfumes especiados
├── jovenes.txt               # Base de datos para menores de 18
└── README.md
git clone https://github.com/techNico-Escolano/FragrancIA.git
