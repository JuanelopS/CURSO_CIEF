// Cargamos el módulo http
const { write } = require('fs');
const http = require('http');

// Puerto de conexión
const PUERTO = 4000;

const contenido = `
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Página principal</title>
</head>
<body>
<h1>Estás en la página principal</h1>
</body>
</html>`;


// Creamos el servidor con createServer
const server = http.createServer((request, response) => {

  response.setHeader('Content-Type', 'text/html; charset=utf-8');

  if(request.url == '/'){
    response.write(contenido);
  }
  else if(request.url == '/productos'){
    response.write('<h1>Estás en la página productos</h1>');
  } else {
    response.write('<h1>Página no encontrada</h1>');
  }

  response.end();
});

// El callback devuelve un mensaje si el puerto funciona bien
server.listen(PUERTO, console.log(`Escuchando en el puerto ${PUERTO}`));