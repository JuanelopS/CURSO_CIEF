/* JUAN GAVIRA */

const argv = require('./config/yargs.js');
const calificacion = require('./calificarAlumno.js');
const { ponerFalta, quitarFalta } = require('./gestionAsistencia.js');
const generarInforme = require('./generarInforme.js');
const formatearNombre = require('./formatearNombre.js');

const alumnos = require('./data/alumnos.json');
const generarInformeIndividual = require('./informeIndividual.js');

if(argv.n){

  /* le quito las tildes a los nombres para evitar problemas */
  const nombre = formatearNombre(argv.n);
 
  /* Verificación de que existe el alumno introducido por el usuario */
  const alumnoExiste = Object.values(alumnos).some(alumno => `${(alumno.nombre + " " + alumno.apellido)}` === nombre);

  if(alumnoExiste) {

    let alumno = nombre;
    
    /*** ACCIONES ***/
    
    if(!isNaN(argv.c) || argv.p || argv.q || argv.info){

      !isNaN(argv.c) && (calificacion(alumno, argv.c)); // calificar (daba problemas el 0 -> funciona con isNaN())
      argv.p && (ponerFalta(alumno, argv.p)); // poner falta
      argv.q && (quitarFalta(alumno, argv.q)); // quitar falta
      argv.info && (generarInformeIndividual(alumno)); // opcion --info: generar informe individual
    } 

  } else {
    console.log(`${nombre} no existe en la base de datos.`);
  }

}

argv.i && (generarInforme()); // opcion -i: generar informe en ./data/informe.txt


  




