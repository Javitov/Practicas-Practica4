# Practicas-Practica4
Práctica 4 | Scripting | ASO

Curso 23-24

Entrega:

Subir el archivo.sh a la tarea habilitada

Nombre de los ficheros:
practica4_Nombre_Apellido1.sh

Entrega
● La entrega la realizaremos a través del repositorio Git.

Script
● Al comenzar el script se debe comprobar si el usuario que lo ejecuta es root.
En caso contrario se mostrara un mensaje y se finaliza el script.
● Los datos de entrada al script estarán en un fichero “paquetes.txt”, con el
formato PACKAGENAME:ACTION.
● El script deberá leer el contenido del fichero de entrada “paquetes.txt”,
donde vendrán definidos los nombres de los paquetes. Deberá cargarlos en
un array para luego procesarlos.
● Para cada elemento del array deberemos ejecutar los comandos necesarios
para actuar sobre cada paquete en un sistema GNU/Linux.
○ Si ACTION es remove o r, entonces desinstalar el software.
■ sudo apt remove apache2
■ sudo apt purge apache2
○ Si ACTION es install o i, entonces instalar el software.
■ sudo apt install apache2
○ Si ACTION es status o s, entonces mostrar un mensaje (instalado o no
instalado).

PISTA para saber si tenemos un programa instalado o no...

● whereis PACKAGENAME | grep bin | wc -l
● zypper se geany | grep 'i '| wc -l
● Si el resultado es 0 → NO está instalado
● Si el resultado es mayor que 0 → SI está instalado
● El script debe actuar de forma NO interactiva. No debe hacer preguntas al
usuario durante la ejecución.
● Antes de realizar cada acción comprobar:
○ Si la acción es "eliminar software" hay que comprobar si el paquete
está instalado.
○ Si la acción es "instalar software" hay que comprobar si el paquete no
está instalado.
