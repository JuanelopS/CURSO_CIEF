
const getPokemon = async id => {
  const data = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
  return await data.json();
}

const container = document.querySelector('.container');


for(i = 1; i < 50; i ++)
{
  getPokemon(i)
    .then( pokemon => {
      container.insertAdjacentHTML('beforeend',`
      <div class="card" style="text-align: center;">
        <a href="https://pokeapi.co/api/v2/pokemon/${i}/">
          <img class="img-pokemon"src="${pokemon.sprites.front_default}">
        </a>
        <div class="card-text">
          <img src="${pokemon.sprites.versions["generation-viii"].icons.front_default}"><span class="name-pokemon">${pokemon.name.toUpperCase()}</span>
        </div>
      </div>
      `) ;
    })
    .catch( err => console.log( err ));
}



// setTimeout(() => location.reload(), 3000);