let hoy = new Date();
console.log(hoy);

let actual = hoy.toLocaleString(); //fecha y hora local
console.log(actual);

//hoy.setUTCHours(19);
//console.log(hoy);

let year = hoy.getFullYear();
console.log(year);

let diaDeLaSemana = hoy.getDay(); // 0-6
console.log(diaDeLaSemana);

let mes = hoy.getMonth(); // 0-11
console.log(mes);

let utc = hoy.getUTCDate();
console.log(utc);

let diaMes = hoy.getDate(); // 1-31
console.log(diaMes);

let toString_ = hoy.toString();
console.log(toString_);

let horaActual = hoy.toLocaleTimeString(); //muestra solo la hora actual
console.log(horaActual);

// Calcular tiempo entre dos fechas:

let vacaciones = new Date(2022, 7, 1); // 7 pq empiezan en 0 los meses (agosto)
let diasQueFaltan = vacaciones - hoy;

let soloDias = diasQueFaltan/1000/60/60/24;
console.log(Math.floor(soloDias)); 



