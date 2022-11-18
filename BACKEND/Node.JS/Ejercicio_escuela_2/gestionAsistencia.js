/* JUAN GAVIRA */

const fs = require('fs');


/* Creación de fichero en 1ª ejecución */
!fs.existsSync('./data/faltas.json') && fs.writeFileSync('./data/faltas.json', '{}');

/* comprobar validez de la fecha introducida */

const validarFecha = (fecha) => {

  const dia = parseInt(fecha.slice(0,2));
  const mes = parseInt(fecha.slice(3,5));
  const anyo = parseInt(fecha.slice(6,10));

  const nuevaFecha = new Date(anyo, mes - 1, dia); // formato de fecha (la variable del mes comienza en 1)

  return Date.parse(nuevaFecha); // devuelve nan si la fecha no es válida

}


/*** PONER FALTA DE ASISTENCIA ***/

const ponerFalta = (alumno, nuevaFalta) => {

  /* comprobación de validez de fecha */
  if(validarFecha(nuevaFalta)){

    const faltas = require('./data/faltas.json');
    
    /* el alumno no tiene faltas anteriores, ponemos la primera */
    if(!faltas.hasOwnProperty(alumno)){

      faltas[alumno] = [nuevaFalta];
      fs.writeFileSync('./data/faltas.json', JSON.stringify(faltas));
      console.log('\n',`Añadida falta de asistencia a ${alumno} el dia ${nuevaFalta}.`.green);

    } else {

      /* comprobación de que la falta introducida no se repita (some -> false) */

      let faltaRepetida = Object.values(faltas[alumno]).some(falta => falta == nuevaFalta);

      if(!faltaRepetida){

        /*  Actualización de faltas [...contenidoArray, nuevoValor ] usando el spread operator */
        let faltasActualizadas = [...Object.values(faltas[alumno]), nuevaFalta];  
        faltas[alumno] = faltasActualizadas;

        /* Ordenación del array de faltas de asistencia */
        faltas[alumno] = Object.values(faltas[alumno]).sort( (a,b) => validarFecha(a) - validarFecha(b));

        fs.writeFileSync('./data/faltas.json', JSON.stringify(faltas));
        console.log('\n',`Añadida falta de asistencia a ${alumno} el dia ${nuevaFalta}.`.green);

      }else {
        console.log('\n',`${alumno} ya tiene una falta de asistencia anotada el día ${nuevaFalta}.`.red)
      }
    } 
  } else {
    console.log('\n',"Fecha introducida no válida. Formato: DD/MM/AAAA".red);
  }
  
}


/*** QUITAR FALTA DE ASISTENCIA ***/

const quitarFalta = (alumno, quitarFalta) => {

  /* comprobación de validez de fecha */
  if(validarFecha(quitarFalta)){

  const faltas = require('./data/faltas.json');

    /* Comprobar que el alumno tenga alguna falta */

  if(faltas.hasOwnProperty(alumno)){
    
    /* faltasActualizadas: Obtener un nuevo array con todas las faltas del alumno excepto la 
    fecha de falta a borrar. */

    let faltasActualizadas = Object.values(faltas[alumno]).filter( falta => falta != quitarFalta);

    /* Si después del filter ambos arrays no tienen la misma longitud es que había una falta de 
    asistencia en la fecha proporcionada -> actualizar faltas.json */

    if(faltasActualizadas.length != faltas[alumno].length){

      faltas[alumno] = faltasActualizadas;

      /* delete: si al borrar una falta ésta fuera la única, borro el alumno(propiedad) del objeto para no dejar un array vacío */
      faltas[alumno].length == 0 && (delete faltas[alumno]);  

      fs.writeFileSync('./data/faltas.json', JSON.stringify(faltas));
      console.log('\n',`Borrada falta de asistencia del dia ${quitarFalta} a ${alumno}.`.blue);

    } else {

      /* En caso de no existir la falta de asistencia a borrar se muestran las que si existen en faltas.json */
      console.log('\n',`${alumno} no tiene anotada una falta de asistencia el día ${quitarFalta}.`.red);
      const faltasReales = Object.values(faltas[alumno]).filter(alumno => alumno == alumno);
      console.log('\n',`${alumno} tiene faltas de asistencia los días ${faltasReales.join(', ')}.`.blue);

    }

  } else {
    console.log('\n',`${alumno} no tiene faltas de asistencia.`.blue);
  }

  }

}

module.exports = {
  ponerFalta,
  quitarFalta
}