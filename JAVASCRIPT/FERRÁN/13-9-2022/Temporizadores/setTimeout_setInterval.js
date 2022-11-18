/* Demora la ejecución de una función que se pasa como primer argumento 
una cantidad de tiempo determinada */ 

// setTimeout(() => console.log("Hola tras 3 segundos"), 3000);


/* Repetir una función cada x milisegundos */

// setInterval(() => console.log("Hola cada segundo"),1000);

let contador = 0;

let intervalo = setInterval(() => console.log(contador++, "Hola cada segundo"), 1000);

setTimeout(() => clearInterval(intervalo), 5000);