const argv = require('yargs')
  .option('n', {
    alias: 'nombre',
    describe: 'Nombre del alumno',
    type: 'string'
  })
  .option('c', {
    alias: 'calificacion',
    describe: 'Calificación del alumno',
    type: 'number'
  })
  .option('p', {
    alias: 'ponfalta',
    describe: 'Introducir falta de asistencia del alumno',
    type: 'string'
  })
  .option('q', {
    alias: 'quitafalta',
    describe: 'Quitar falta de asistencia del alumno',
    type: 'string'
  })
  .option('i', {
    alias: 'informe',
    default: false,
    describe: 'Generar informe del alumnado',
    type: 'boolean'
  })
  .option('info', {
    default: false,
    describe: 'Generar informe individual',
    type: 'boolean'
  })
  .check(argv => {
    if(!argv.n && !argv.i && !argv.info) {
      throw new Error (`Introduzca el argumento '-n' para calificar o anotar/quitar falta a un alumno o '-i' para generar un informe del alumnado.`);
    } 
    else return true;
  })
  .check(argv => {
    if(argv.c < 0 || argv.c > 10) {
      throw new Error ('La calificación de los alumnos debe ser un número comprendido entre 0 y 10.');
    }
    else return true;
  })
  .check(argv => {
    if(argv.n && !(!isNaN(argv.c) || argv.p || argv.q || argv.info )){
      throw new Error (`Alumno/a ${argv.n}: Debe indicar una calificación o quitar/poner falta de asistencia.`);
    }
    else return true;
  })
  .argv;

module.exports = argv;
