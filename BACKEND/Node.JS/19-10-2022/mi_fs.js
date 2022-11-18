const fs = require ('fs');

// console.log(fs);

fs.writeFile('test.txt', 'Esto es un archivo de prueba', error => {
  if(error) throw error;
  console.log("1. Fichero test.txt creado!");
});

// fs.writeFileSync('test.txt', 'Esto es un archivo de prueba'); // funciones fs async sin callback
// console.log("1. Fichero test.txt creado!");

fs.appendFile('test.txt', '\nLínea añadida', error => {
  if(error) throw error;
  console.log("2. fs.appendFile ejecutado");
});

fs.rename('test.txt', 'nuevoNombre.txt', error => {
  if(error) throw error;
  console.log("3. Renombrado!");
});

// fs.copyFile('testRenombrado.txt', 'test3.txt', error => {
//   if(error) throw error;
//   console.log("Archivo copiado!");
// });

fs.readFile('nuevoNombre.txt', 'utf-8', (error, data) => {
  if(error) throw error;
  console.log(data);
  console.log("4. Archivo leído!");
});

fs.mkdir('testRenombrado.txt', err => {
  if(err) throw err;
  console.log("5. Directorio creado!");
});

// fs.rm('testRenombrado.txt', err => {
//   if(err) throw err;
//   console.log("Archivo borrado!");
// });

fs.truncate('test.txt', err => {
  if(err) throw err;
  console.log("6. Archivo truncado!");
});



