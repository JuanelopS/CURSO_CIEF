let http = require("http");

/* Creación de servidor (sólo respuesta) */
let server = http.createServer((peticion, respuesta) => {
  respuesta.end("Hola Juan");
});

/* Up del servidor */
server.listen(3000, () => {
  console.log("Servidor escuchando en puerto " + server.address().port);
});