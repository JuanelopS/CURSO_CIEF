/* Carga el package en memoria */
const express = require('express');
/* Asignamos la función a una variable */
const app = express();

/* Asignación del puerto */
const { PORT = 3000 } = process.env;
// const PORT = process.env.PORT || 3000

/* Importación de los datos */
const clientes = require('./datos/clientes.js');

app.get('/', (req, res) => {
  /* Enviar un texto en la raíz del sitio*/
  // res.send('<h1><marquee style="color: red">Buenas tardes!</marquee></h1>');
  /* Enviar un texto */
  res.sendFile(`./static/index.html`, { root: __dirname });
});

app.get('/clientes', (req, res) => {
  res.sendFile(`./static/clientes.html`, { root: __dirname });
});

app.get('/api/clientes', (req, res) => {
  res.send(JSON.stringify(clientes));
});

app.get('/api/clientes/:nombreClienteParam', (req, res) => {
  
  const nombreClienteParam = req.params.nombreClienteParam;
  const resultado = clientes.filter( ({ nombre }) => nombre === nombreClienteParam);
  resultado.length ? 
    res.send(resultado)
    : 
    res.send(`<marquee><h2>No se ha encontrado el cliente <span style='color: red'>${nombreClienteParam}</span></h2></marquee>`);
});


app.get('/api/ciudad/:nombreCiudad', (req, res) => {
  
  const nombreCiudad = req.params.nombreCiudad;
  const resultado = clientes.filter( ({ ciudad }) => ciudad === nombreCiudad);
  res.send(resultado);
  
});


app.get('/api/clientes-ciudad/:nombreClienteParam/:nombreCiudad', (req, res) => {
  
  const nombreClienteParam = req.params.nombreClienteParam;
  const nombreCiudad = req.params.nombreCiudad;
  const resultado = clientes.filter( ({ nombre, ciudad }) => ciudad === nombreCiudad && nombre === nombreClienteParam);
  res.send(resultado);
  
});


app.use(express.static('static'));

/* Redirección hacia página no encontrada cuando no se encuentra el recurso */
app.all('*', (req, res) => {
  res.status(404).sendFile(`./static/404.html`, { root: __dirname });
});

app.listen(PORT, () => console.log(`Listen at http://localhost:${PORT}...`));