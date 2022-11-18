/* Necesitas una página web con dos bloques div. El primer bloque contiene el texto "Pasa por aqui" y el segundo "Efectos del movimiento" con un argumento id = "efecto" . Cuando el ratón pase por el primer bloque se llamará a la función color que cambia el fondo del segundo bloque a color verde (backgroundColor green") */

let primerDiv = document.getElementsByTagName("div")[0];
let segundoDiv = document.getElementById("efecto");

primerDiv.onmouseover = () => segundoDiv.style.backgroundColor = "green";
