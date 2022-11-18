// Para una escuela de idiomas, hace falta saber:
// 1) que alumnos son menores de edad, ya que se pasa la información de su asistencia a los padres
// 2) que alumnos son mayores de 65, ya que disponen de un descuento en la matrícula, a razón de
// un 5% por cada año que pasen de 64.

const precioBaseMatricula = 250;

// Función que indique para los alumnos menores de edad
// su nombre, cuantos años tienen y cuantos días les faltan para cumplir 18
// De este modo:
// Pepa Pi tienes 17 años y te faltan 32 días para cumplir 18 años.

// Función que indique que alumnos pasan de 65 años, a qué descuento tienen derecho y
// cuanto costaría su matrícula. Por ejemplo:
// Pau Guerra tienes 66 años, tu descuento es del 10% y el importe de tu matrícula es de 225 € 

const alumnos = require('./alumnos.js');

const ahora = new Date(Date.now());

const calcularBisiestos = fecha => {
  return parseInt((ahora.getFullYear() - new Date(fecha).getFullYear()) / 4);
}

// console.log(calcularBisiestos('1995-10-11'));

const comprobarEdad = fecha_nacimiento => {
  return parseInt((ahora - new Date(fecha_nacimiento)) / (1000 * 3600 * 24 * 365));
}

const diasRestantes = fecha_nacimiento => {
  let mayoriaEdad = 1000 * 3600 * 24 * 365 * 18;
  let EdadActual = ahora - new Date(fecha_nacimiento).getTime();
  let resultado = (mayoriaEdad - EdadActual) / ((1000 * 3600 * 24));
  return parseInt(resultado);
}

console.log('******** MENORES ***********');

const menoresEdad = alumnos.map( ({ nombre, apellido, fecha_nacimiento }) => {

  if(comprobarEdad(fecha_nacimiento) <= 18){
    let edad = 0;
    if(diasRestantes(fecha_nacimiento) < 0){
      edad = comprobarEdad(fecha_nacimiento) - 1;
    } else edad = comprobarEdad(fecha_nacimiento);
    console.log(`${nombre} ${apellido} tienes ${edad} años y te faltan ${diasRestantes(fecha_nacimiento) + calcularBisiestos(fecha_nacimiento)} días para cumplir los 18 años`);
  }

});

console.log('******** MAYORES ***********');

const mayoresEdad = alumnos.map( ({ nombre, apellido, fecha_nacimiento }) => {

 if(comprobarEdad(fecha_nacimiento) >= 65){

    let descuento = (comprobarEdad(fecha_nacimiento) - 64) * 5;
    console.log(`${nombre} ${apellido} tienes ${comprobarEdad(fecha_nacimiento)} años, tienes derecho a un descuento de ${descuento}% y el importe de tu matrícula es ${(precioBaseMatricula - (precioBaseMatricula * (descuento/100))).toFixed(2)}€ `);
  }

});

