export default class ApiRest {
  constructor( urlBase ){
    this.urlBase = urlBase;
  }

  async get( endPoint ) {
    const url = this.urlBase + endPoint;

    const peticion = await fetch( url ,{
      method: 'GET',
      headers: {
        "Accept": "application/json"
      }
    });

    if( peticion.status === 200 ){
      let json = await peticion.json();
      return json;

    } else {
      peticion.statusText;
    }

  }

  // qué queremos mostrar y dónde
  pintarPersonajes( listaPersonajes, objetoDOM ) {
    console.log(listaPersonajes);

    objetoDOM.innerHTML = '';

    listaPersonajes.length > 0 ?
    listaPersonajes.map( personaje => {
      objetoDOM.innerHTML += `
        <div class="card" style="width: 22rem; padding: 0; overflow: hidden">
          <img
            src="${personaje.img}"
            alt="${personaje.name}"
            style="height: 350px"
          />
          <div class="card-body">
            <h5 class="card-title">${personaje.name}</h5>
            <p class="card-text">Actividad: ${personaje.occupation}</p>
            <p class="card-text">Estado: ${personaje.status}</p>
          </div>
        </div>
      `;
    })
    : objetoDOM.innerHTML = `<h2 class="text-center">No hay resultados</h2>`;
  }
}
