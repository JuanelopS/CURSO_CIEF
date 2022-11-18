preguntarHora();

function preguntarHora(){
    let respuesta = parseInt(prompt("¿Qué hora es?"));
    console.log(responderHora(respuesta));
}

function responderHora(resp) {
  // Que el valor introducido sea entre 1 y 23;
  if (/\d/.test(resp) && (resp > 0 && resp <= 23) && !!resp) {
    if (resp >= 6 && resp <= 14) 
      return "Buenos días"; // Entre 6 y 14
    else if (resp >= 15 && resp <= 21)
      return "Buenas tardes"; // Entre 15 y 21
    else 
      return "Buenas noches"; // Resto de horas no definidas
  } else if (resp == 0) 
      return "Buenas noches (las 0 horas son las 12)";
  else 
    return preguntarHora(); // pregunto de nuevo la hora
}

