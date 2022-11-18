/* JUAN GAVIRA */

const fs = require('fs');
const colors = require('colors');

/* Creación de fichero en 1ª ejecución */
!fs.existsSync('./data/calificaciones.json') && fs.writeFileSync('./data/calificaciones.json', '{}');

/*** CALIFICACIONES ***/

const calificacion = (alumno, calificacion) => {

  const calificaciones = require('./data/calificaciones.json');
      
  /* Introducir/actualizar calificación */
  calificaciones[alumno] = calificacion;
  fs.writeFileSync('./data/calificaciones.json', JSON.stringify(calificaciones));
  console.log('\n',`${alumno} calificado/a con una nota de ${calificacion}.` .green);
} 

module.exports = calificacion;