const argv = require('yargs')
  .option('o', {
    alias: 'operador',
    demandOption: true,
    // default: '/etc/passwd',
    describe: 'Operador de la multiplicación',
    type: 'number'
  })
  .option('i', {
    alias: 'idioma',
    // demandOption: true,
    // default: '/etc/passwd',
    default: 'eng',
    describe: 'Idioma de la tabla',
    type: 'string'
  })
  .option('c', {
    alias: 'noconsole',
    default: false,
    describe: 'Impide la salida por consola',
    type: 'boolean'
  })
  .option('t', {
    alias: 'notxt',
    default: false,
    describe: 'Impide producir el fichero txt',
    type: 'boolean'
  })
  .option('d', {
    alias: 'dirtxt',
    demandOption: false,
    default: 'TXT',
    describe: 'Creación de directorio',
    type: 'boolean'
  })
  .check((argv) => {
    if(isNaN(argv.o)) throw new Error ('El operador debe ser un número');
    else return true;
  }) 
  .argv;

module.exports = argv;