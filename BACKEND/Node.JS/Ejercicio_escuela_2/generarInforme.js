/* JUAN GAVIRA */

const fs = require('fs');
const alumnos = require('./data/alumnos.json');

/*** GENERAR INFORME ***/

const generarInforme = () => {

  const encabezado = 'Alumnado del curso' + '\n' + '------------------' + '\n\n';

  !fs.existsSync('./data/informe.txt') && fs.writeFileSync('./data/informe.txt', encabezado);

  let informe = `${encabezado}`;

  const calificaciones = require('./data/calificaciones.json');
  const faltas = require('./data/faltas.json');

  /* Recorrido del array de alumnos para mostrar sus calificaciones y notas */

  alumnos.map( alumno => {
    
    informe += (`${alumno.nombre} ${alumno.apellido}`);
    informe += '\n';

    /* calificaciones -> ternario para mostrar su nota o pendeinte */
    calificaciones[`${alumno.nombre} ${alumno.apellido}`] ?
      (informe += ('Calificación: ' + calificaciones[`${alumno.nombre} ${alumno.apellido}`]))
      :
      (informe += ('Calificación: pendiente'));

    informe += '\n';

    /* faltas de asistencia: lista de fechas o ninguna */
    faltas[`${alumno.nombre} ${alumno.apellido}`] ?
      (informe += ('Faltas de asistencia: ' + faltas[`${alumno.nombre} ${alumno.apellido}`].join(', ')))
      :
      (informe += ('Faltas de asistencia: ninguna'));
    
    informe += '\n\n\n';
  });

  // console.log(informe);

  fs.writeFileSync('./data/informe.txt', informe);
  console.log('\n',`Informe de alumnado generado en './data/informe.txt'.`.blue);

}

module.exports = generarInforme;