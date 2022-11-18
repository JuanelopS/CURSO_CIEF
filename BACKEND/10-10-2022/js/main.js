import ApiRest  from "./classApi.js";

const btnBuscar = document.querySelector('#btnBuscar');
const inputPersonaje = document.querySelector('#inputPersonaje');
const contenedorPersonajes = document.querySelector('#contenedorPersonajes');

// API de Breaking Bad
const breakingBadAPI = `https://www.breakingbadapi.com/api/`;
const breakingBadObject = new ApiRest(breakingBadAPI);

breakingBadObject.get(`characters`)
  .then( result => {
    breakingBadObject.pintarPersonajes(result, contenedorPersonajes)
  })
  .catch( err => console.log( err ));

const obtenerPersonaje = e => {
  e.preventDefault();
  let nombrePersonaje = inputPersonaje.value;
    breakingBadObject.get(`characters?name=${nombrePersonaje}`)
      .then( result => {
        breakingBadObject.pintarPersonajes(result, contenedorPersonajes)
      })
      .catch( err => console.log( err ));
}

btnBuscar.addEventListener('click', obtenerPersonaje);



  

