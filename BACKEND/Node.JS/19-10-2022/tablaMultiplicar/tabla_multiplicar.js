// JUAN GAVIRA

const fs = require('fs');

const argumento = parseInt(process.argv[2]);
const fichero = `tabla_multiplicar_${argumento}.txt`;

fs.writeFileSync(fichero, `
================================
== Tabla de multiplicar del ${argumento} ==
================================
`);

/* appendFileSync te crea el archivo si no existe */
for(let x = 1; x <= 10; x++){
  fs.appendFileSync(fichero, `${argumento} * ${x} = ${argumento * x}\n`);
}

fs.appendFileSync(fichero, `================================`);


