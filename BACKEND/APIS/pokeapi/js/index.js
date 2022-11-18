
const getPokemon = async id => {
  const data = await fetch(`https://pokeapi.co/api/v2/pokemon/${id}`);
  return await data.json();
}

let random = Math.floor(Math.random() * 350);
console.log(random);

const container = document.querySelector('.container');

getPokemon(random)
  .then( pokemon => {
    container.innerHTML = `
    <div style="text-align: center;">
      <img src="${pokemon.sprites.other["official-artwork"].front_default}" width="400px">
      <a href="https://pokeapi.co/api/v2/pokemon/${random}/">
        <img src="${pokemon.sprites.front_default}" width="450px">
      </a>
      <h1>
        <img src="${pokemon.sprites.versions["generation-viii"].icons.front_default}" width="125px">${pokemon.name.toUpperCase()}
      </h1>
    </div>
    `;
  })
  .catch( err => console.log( err ));


getPokemon(random).then(pokemon => console.log(pokemon));

// setTimeout(() => location.reload(), 3000);

