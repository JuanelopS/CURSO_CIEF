
export const pokeapi = () => {


  let random = Math.floor(Math.random() * 350);

  const url = `https://pokeapi.co/api/v2/pokemon/${random}`;

  fetch(url)
    .then(response => response.json())
    // .then(response => console.log(response))
    .then(response => {
        document.body.insertAdjacentHTML('afterbegin',`
        <div style='display: flex'>
        <h2>${response.name}:</h2>
        <img style='width: 800px' src='${response.sprites.front_default}'>
        </div>
        `);
    })
   
    .catch(error => document.body.innerHTML = error.message);

    setInterval(() => location.reload(), 1000);
}



// sprites.front_default


// const url = 'https://pokeapi.co/api/v2/pokemon-species/';

// fetch(url)
//   .then(response => response.json())
//   .then(response => response.results)
//   .then(pokemon => pokemon.map(item => { 
//     document.body.innerHTML += `
//       <a href='${item.url}'>${item.name}</a><br>
//   `}));
