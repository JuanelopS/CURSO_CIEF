// Cargamos el módulo http
const http = require('http');

// Creamos el servidor con createServer
http.createServer((request, response) => {
  
  console.log(http.STATUS_CODES);

  // Última instrucción para el servidor
  response.end('Hola');

}).listen(3000); // puerto de conexión