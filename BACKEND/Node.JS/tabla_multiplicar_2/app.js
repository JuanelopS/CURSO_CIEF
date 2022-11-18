const fs = require('fs');
const colors = require('colors');
const os = require('node:os');
const argv = require('./config/yargs.js');

const sleep = ms => {
  return new Promise(resolve => setTimeout(resolve, ms));
};

const log = async (string, delay) => {
  for (const letra of string){
    process.stdout.write(letra);
    await sleep(Math.random() * delay);
  }
  process.stdout.write('\n');
};


/* Función que recoge los idiomas de archivo json para
el encabezado de la tabla y el nombre del archivo. Termina la ejecución si el usuario pasa como argumento un lenguaje no existente */

function leeIdioma ( idioma ){

  const idiomasString = fs.readFileSync('./config/idiomas.json', 'utf-8');
  const idiomasObj = JSON.parse(idiomasString);
  const textoIdioma = idiomasObj[idioma];
  // Finalizar programa si se introduce un idioma desconocido
  if (textoIdioma == undefined) {
    console.log("Language unknown | Idioma desconocido");
    process.exit();
  }
  return textoIdioma;
}

const encabezado = leeIdioma(argv.idioma);


/* Función que crea la tabla, recibiendo como parámetros
el numero introducido por el usuario y el encabezado recibido de la función leeIdioma  */

function crearTabla( operador, textoIdioma ){

  let texto = "=================================\n";
  texto += `== ${textoIdioma} ${operador} ==\n`
  texto += "=================================\n";

  for (let i = 1; i <= 10; i++) {
    texto += `\t${operador} x ${i} = ${operador * i}\n`;
  }

  return texto;
}

const textoTabla = crearTabla(argv.operador, encabezado);

/* opciones de mostrar por consola / generar el fichero */

if(!argv.c){
  log(textoTabla, 10);
}

if(!argv.t){

  // Crear el nombre del fichero con subguiones
  const tituloFichero = encabezado.split(' ').join('_');

  // Directorio para guardar el txt
  const txtDir = argv.dirtxt + '/' + argv.idioma;
  // Si no existe el directorio lo crea
  if (!fs.existsSync(txtDir)) {
      // La opción recursive es porque añadimos más de un nivel    
      fs.mkdirSync(txtDir, {recursive: true})
  }
  // Crea el fichero en el directorio especificado
  fs.writeFileSync(`${txtDir}/${tituloFichero}_${argv.operador}.txt`, textoTabla);
}

