// Cargamos el módulo http
const http = require('http');

const PUERTO = 4000;

// Creamos el servidor con createServer
const server = http.createServer((request, response) => {

  console.log('url: ', request.url);
  console.log('method: ', request.method);
  console.log('headers: ', request.headers);

  console.log('statusCode: ', response.statusCode);
  // response.statusCode = 404;
  // Última instrucción para el servidor
  response.end('Hola');

});

server.listen(PUERTO, console.log(`Escuchando en el puerto ${PUERTO}`));