const obtenerDatos = async () => {
  const api = await fetch(`https://www.breakingbadapi.com/api/characters?limit=10`);
  return await api.json();
}

  const container = document.querySelector('.container');
  
  obtenerDatos()
    .then( item => item.map( card => 
      container.insertAdjacentHTML('beforeend', `
      <div class="card" style="width: 18rem; padding: 0; overflow: hidden">
        <img
          src="${card.img}"
          alt="${card.name}"
          style="height: 300px"
        />
        <div class="card-body">
          <h5 class="card-title">${card.name}</h5>
          <p class="card-text">Actividad: ${card.occupation}</p>
          <p class="card-text">Estado: ${card.status}</p>
        </div>
      </div>
      `)
    ))
    .catch( err => console.log( err ));

  obtenerDatos()
  .then(item => console.log( item ));
