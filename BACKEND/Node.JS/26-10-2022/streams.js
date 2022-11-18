const fs = require('fs');

// fs.readFileSync('./moby10b.txt', 'utf-8', (err, libro) => {
  
//   if(err){
//     throw err
//   } else console.log(libro);

// });

let stream = fs.createReadStream('./moby10b.txt', 'utf-8');
let datos = '';

stream.once('data', () => {
  console.log('Empezando el flujo');
});

stream.on('data', (chunks) => {
  datos += chunks;
});

stream.on('end', () => {
  console.log('Stream completado!');
  console.log(datos.length);
});

