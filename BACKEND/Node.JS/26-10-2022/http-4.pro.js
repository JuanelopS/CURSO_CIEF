const { createServer } = require('http');
const { createReadStream } = require('fs');
const path = require('path');

/* Puerto de conexión */

const {PUERTO = 4000} = process.env;

/* Tipo de fichero a enviar */

const HTML_CONTENT_TYPE = 'text/html';
const CSS_CONTENT_TYPE = 'text/css';
const JS_CONTENT_TYPE = 'text/js';

/* Construir la ruta de los ficheros a devolver con la petición */
const DIR_HTML = path.join(__dirname, 'src');
/* console.log(__dirname); */
/* console.log(DIR_HTML); */

const server = createServer((request, response) => {
  // Obtener la ruta
  const { url } = request;
  // Caso de respuesta correcta
  let statusCode = 200;
  // Empezamos por el fichero HTML
  let contentType = HTML_CONTENT_TYPE;

  // Preparamos el flujo para la lectura de los ficheros
  let stream;

  // Inicio desde la ruta raíz
  if(url === '/'){
    // Flujo para la lectura del fichero html
    stream = createReadStream(`${DIR_HTML}/index.html`);
  }
  else if(url.match(/.css$/)){
    contentType = CSS_CONTENT_TYPE;
    // Flujo para la lectura del fichero css
    stream = createReadStream(`${DIR_HTML}/style.css`);
  }
  else if(url.match(/.js$/)){
    contentType = JS_CONTENT_TYPE;
    // Flujo para la lectura del fichero js
    stream = createReadStream(`${DIR_HTML}/index.js`);
  }
  else {
    // si llega aquí es que no se encuentra el recurso
    statusCode = 404;
  }

  // Creación de la cabecera
  response.writeHead(statusCode, { 'Content-Type': contentType });

  // Envío del stream como respuesta en caso de que exista
  if(stream){
    stream.pipe(response);
  } else return response.end('No he encontrado el recurso');

});


server.listen(PUERTO, () => {
  console.log(`Servidor por escuchando por http://localhost:${PUERTO}`);
});