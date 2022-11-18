const http = require('http');

// console.log(http);

http.createServer((request, response) => {
  // console.log(request.url);

  let mensajeHTML = '';

  if(request.url == '/'){
    mensajeHTML = '<h1>Estás en la página principal</h1>';
  } else if (request.url == '/alumnos'){
    mensajeHTML = '<h1>Estás en la página de alumnos. <a href="/">Volver a la página principal.</a></h1>';
  } else {
    mensajeHTML = '<h1>Página no encontrada. <a href="/">Volver a la página principal.</a></h1>';
  }
  response.setHeader("Content-Type", "text/html; charset=utf-8");
  response.write(mensajeHTML, 'utf8', () => console.log('Respondiendo al usuario'));
  response.end();

}).listen(4000);