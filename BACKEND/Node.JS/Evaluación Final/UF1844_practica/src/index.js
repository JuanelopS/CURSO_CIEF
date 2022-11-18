/* JUAN GAVIRA */

const express = require("express");
const path = require("path");
const { argv } = require("process");
const app = express();

/* Puerto según el parámetro introducido */
const { PORT = argv[2] } = process.env;

/* Importación de los datos y saco a otra variable los datos de los pacientes */
const datos = require("../data/pacientes.json");
const pacientes = datos[2].data;

// Directorio del fichero index.html
const dirHTML = 'public';

// Obtiene el directorio de los ficheros estáticos
app.use(express.static(dirHTML));

app.get('/', (req, res) => {
  res.sendFile(dirHTML, { root: __dirname });
});

/* 1. localhost:3000/api/pacientes
Mostrará todos los pacientes ordenados alfabéticamente por apellido de la A a la Z, pero solo su
apellido y nombre, de este modo:
Abnuy, Rafael
Adam, Nathaniel
….
¡Ojo! No es un JSON… */

app.get('/api/pacientes', (request, response) => {

  /* Ordenación segun sort y localCompare (al ser string), luego pinta el resultado mediante un map y template string */
  const resultado = pacientes.sort((a,b) => a.apellido.localeCompare(b.apellido));
  response.send(resultado.map(({ nombre, apellido }) => `${apellido}, ${nombre}`));
  
});

/* 3. localhost:3000/api/servicio/urgencias o localhost:3000/servicio/consultas
Crear un filtro por tipo de servicio, que se añadirá a la url:
localhost:3000/servicio.
Si se introduce un servicio inexistente debe aparecer el mensaje:
“No existe ningun servicio con ese nombre” (sin las comillas) */

app.get('/api/servicio/:servicio', (request, response) => {

  const servicioParam = request.params.servicio;
  
  /* si el parametro es urgencias o consultas, que haga el correspondiente filter */
  if(servicioParam === 'urgencias' || servicioParam === 'consultas'){

    const resultado = pacientes.filter( ({ servicio }) => servicioParam === servicio );
    response.send(resultado);

  } else{
    response.send('No existe ningún servicio con ese nombre');
  }
});

/* 4. localhost:3000/api/pacientes/nif
Filtrar los pacientes según su nif, mostrando sus datos completos en formato JSON. Por ejemplo:
localhost:3000/api/pacientes/26902806M
Si se introduce un nif inexistente debe aparecer el mensaje:
“No existe ningun paciente con ese nif” (sin las comillas) */

app.get('/api/pacientes/:nif', (request, response) => {

  /* filter según el parámetro nif */
  const nifParam = request.params.nif;
  const resultado = pacientes.filter(paciente => paciente.nif === nifParam);

  resultado.length === 0 ? 
  response.send(`No existe ningún paciente con ese nif (${nifParam}).`)
  :
  response.json(resultado);

});

/* 5. localhost:3000/api/ciudades
  Lista de pacientes en formato JSON ordenados por ciudades. */

app.get('/api/ciudades', (request,response) => {

    /* sort según la propiedad ciudad */
    const resultado = pacientes.sort((a,b) => a.ciudad.localeCompare(b.ciudad));
    response.json(resultado);

});


/*  6. localhost:3000/api/ciudades/ciudad
    Filtrar los pacientes según su ciudad, mostrando sus datos completos en formato JSON. Por ejemplo:
    localhost:3000/api/ciudades/Barcelona
    Si se introduce una ciudad inexistente debe aparecer el mensaje:
    “No existe consta ningun paciente de esa ciudad” (sin las comillas) */
  

app.get('/api/ciudades/:ciudad', (request, response) => {

  /* filter según el parámetro ciudad */
  const ciudadParam = request.params.ciudad;
  console.log(ciudadParam);

  const resultado = pacientes.filter(({ciudad}) => ciudad === ciudadParam);
  
  resultado.length === 0 ? 
  response.send(`No existe ningun paciente de esa ciudad (${ciudadParam}).`)
  :
  response.json(resultado);

});

/* 7. localhost:3000/api/pacientes‐ciudad
Contar los pacientes por ciudad .
Si se introduce una ciudad inexistente debe aparecer el mensaje:
“No existe consta ningun paciente de esa ciudad” (sin las comillas) */

app.get('/api/pacientes-ciudad', (request, response) => {

  /* map de los pacientes, y voy llenando el objeto vacio ciudades. Si existe la propiedad (hasOwnProperty) le sumo uno, en caso contrario, meto la propiedad inicializándola a 1 */

  const ciudades = {};
  pacientes.map ( ({ ciudad }) => {
    if(ciudades.hasOwnProperty(ciudad)){
      ciudades[ciudad] = ciudades[ciudad] + 1;
    }else {
      ciudades[ciudad] = 1;
    }
  })
  response.send(ciudades);

})
  

/* 8. Mostrar la página 404.html cuando se introduza una url inexistente. */

/* He tenido que usar el módulo 'path' ya que al intentar hacer un '../' me saltaba un error 'Forbidden' de node */

app.get("*", (request, response) => {
  response.status(404).sendFile(path.join(__dirname + `/../public/404.html`));
});


app.listen(PORT, () => console.log(`Listen at http://localhost:${ PORT }...`));