const fs = require ('fs');

// console.log(fs);

// FUNCIONES FS SYNC NO LLEVAN CALLBACK

fs.writeFileSync('test.txt', 'Esto es un archivo de prueba'); 
console.log("1. Fichero test.txt creado!");

fs.appendFileSync('test.txt', '\nLínea añadida');
console.log("2. appendFileSync ejecutado");

fs.renameSync('test.txt', 'nuevoNombre.txt');
console.log("3. Renombrado!");

const textoFichero = fs.readFileSync('nuevoNombre.txt', 'utf-8');
console.log("4. Archivo leído!", textoFichero);

fs.mkdirSync('nuevaCarpeta');
console.log("5. Directorio creado!");

fs.truncateSync('nuevoNombre.txt');
console.log("6. Archivo truncado!");




