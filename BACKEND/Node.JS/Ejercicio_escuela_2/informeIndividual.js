/* JUAN GAVIRA */

const fs = require('fs');
const alumnos = require('./data/alumnos.json');

/*** GENERAR INFORME INDIVIDUAL ***/

const generarInformeIndividual = nombreAlumno => {

  !fs.existsSync('Informes individuales') && fs.mkdirSync('Informes individuales');

  let informe = ``;

  const calificaciones = require('./data/calificaciones.json');
  const faltas = require('./data/faltas.json');

  /* Recorrido del array de alumnos para obtener el alumno en cuestión según el nombre introducido por el usuario */

  const alumnoSeleccionado = Object.values(alumnos).filter( alumno => `${alumno.nombre + " " + alumno.apellido}` === nombreAlumno);
    
  informe += (`Alumno/a: ${nombreAlumno}`);
  informe += '\n';

  /* calificaciones -> ternario para mostrar su nota o pendeinte */
  calificaciones[`${alumnoSeleccionado[0].nombre} ${alumnoSeleccionado[0].apellido}`] ?
    (informe += ('Calificación: ' + calificaciones[`${alumnoSeleccionado[0].nombre} ${alumnoSeleccionado[0].apellido}`]))
    :
    (informe += ('Calificación: pendiente'));

  informe += '\n';

  /* faltas de asistencia: lista de fechas o ninguna */
  faltas[`${alumnoSeleccionado[0].nombre} ${alumnoSeleccionado[0].apellido}`] ?
    (informe += ('Faltas de asistencia: ' + faltas[`${alumnoSeleccionado[0].nombre} ${alumnoSeleccionado[0].apellido}`].join(', ')))
    :
    (informe += ('Faltas de asistencia: ninguna'));
  
  informe += '\n';

  /* writeFileSync no se lleva bien con el resultado de date.now() por las '/' */
  let fecha = new Date(Date.now()).toLocaleDateString().replace(/[/]/g, '-');
  fs.writeFileSync(`./Informes individuales/${nombreAlumno}_${fecha}.txt`, informe);
  console.log('\n',`Informe de alumno/a ${nombreAlumno} generado.`.blue);

}

module.exports = generarInformeIndividual;