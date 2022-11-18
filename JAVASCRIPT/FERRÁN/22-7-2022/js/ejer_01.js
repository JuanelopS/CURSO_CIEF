const DIAS = [
  "lunes",
  "martes",
  "miercoles",
  "jueves",
  "viernes",
  "sabado",
  "domingo",
];
const DAYS = [
  "monday",
  "tuesday",
  "wednesday",
  "thursday",
  "friday",
  "saturday",
  "sunday",
];

let respuesta = prompt("Que día de la semana es hoy?");

// Si el prompt devuelve 'n' termina el bucle
while (respuesta != "n") {
  if (respuesta == DIAS[4]) {
    console.log(`Yes, today is ${DAYS[4]}`);
  } else {
    console.log(`Error, today isn't ${respuesta}, it's ${DAYS[4]}`);
    respuesta = prompt("Que día de la semana es hoy?");
  }
}


