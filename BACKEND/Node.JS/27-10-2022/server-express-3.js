const express = require("express");
const app = express();

const { PORT = 3000 } = process.env;
// const PORT = process.env.PORT || 3000

/* Importación de los datos */
const { clientes, productos } = require("./datos/datos-empresa.json");

// Directorio del fichero index.html
const dirHTML = 'static';
// Obtiene el directorio de los ficheros estáticos
app.use(express.static(dirHTML));


/* app.get("/", (req, res) => {
  res.sendFile(`./static/index.html`, { root: __dirname });
}); */


app.get('/clientes', (req, res) => {
  res.sendFile(__dirname + '/' + dirHTML + '/clientes.html')
})


/* TODO || SOLO PRODUCTOS || SOLO CLIENTES */
app.get("/api", (req, res) => {
  res.json({ clientes, productos });
});

app.get("/api/productos", (req, res) => {
  res.json(productos);
});

app.get("/api/clientes", (req, res) => {

  //console.log(req.query.nombreCliente); //req.query case sensitive
  if(req.query.nombreCliente){
    const nombreQuery = req.query.nombreCliente;
    const resultado = clientes.filter(({ nombre }) => nombre === nombreQuery);
    res.json(resultado);
  } 
  
  
});

/* NOMBRE CLIENTE Y ORDENACIÓN SEGÚN QUERY INTRODUCIDA */
app.get("/api/clientes/:nombreCliente", (req, res) => {
  const nombreCliente = req.params.nombreCliente;
  const resultado = clientes.filter(({ nombre }) => nombre === nombreCliente);
  if(!req.query.ordenar) {
    res.json(resultado);
  }
  else {
    const query = req.query.ordenar;
    const ordenado = resultado.sort((a,b) => a[query].localeCompare(b[query]));
    res.json(ordenado);
  }
});

/* NOMBRE PRODUCTO */
app.get("/api/productos/:nombreProducto", (req, res) => {
  const nombreProducto = req.params.nombreProducto;
  const resultado = productos.filter(({ nombre }) => nombre === nombreProducto);
  resultado.length
    ? res.json(resultado)
    : res.send(
        `<marquee><h2>No se ha encontrado el producto <span style='color: red'>${nombreProducto}</span></h2></marquee>`
      );
});


/* PRODUCTO SEGÚN SU LETRA INICIAL */
app.get("/api/productos/letra-inicial/:letraInicial", (req, res) => {
  const letraInicial = req.params.letraInicial;
  const resultado = productos.filter(({ nombre }) => nombre.startsWith(letraInicial));
  resultado.length
    ? res.json(resultado)
    : res.send(
        `<marquee><h2>No se ha encontrado un producto que comience por "<span style='color: red'>${letraInicial}</span>"</h2></marquee>`
      );
});


/* FRUTAS SEGÚN TEMPORADA */
app.get("/api/productos/temporada/:nombreTemporada", (req, res) => {
  const nombreTemporada = req.params.nombreTemporada;
  const resultado = productos.filter(({ temporada }) => temporada === nombreTemporada);
  resultado.length
    ? res.json(resultado)
    : res.send(
        `<marquee><h2>No se han encontrado productos de <span style='color: red'>${nombreTemporada}</span></h2></marquee>`
      );
});


/* FRUTAS CON PRECIO SUPERIOR A LA MEDIA */
app.get("/api/productos-media-superior", (req, res) => {
  const suma = productos.reduce((prev, curr) => prev + curr.precio, 0);
  const mediaPrecio = suma / productos.length;
  const resultado = productos.filter(({ precio }) => precio > mediaPrecio);
  res.json(resultado);
});



/* Redirección hacia página no encontrada cuando no se encuentra el recurso */
/* app.all("*", (req, res) => {
  res.status(404).sendFile(`./static/404.html`, { root: __dirname });
});
 */

app.get('*', (req, res) => {
  res.status(404).sendFile('./' + dirHTML + `/404.html`, { root: __dirname });
});

app.listen(PORT, () => console.log(`Listen at http://localhost:${PORT}...`));


