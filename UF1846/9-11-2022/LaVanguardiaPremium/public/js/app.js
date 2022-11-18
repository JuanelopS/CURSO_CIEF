const divNoticias = document.querySelector('.noticias');

const URL = 'http://localhost:4000/scraper';

fetch(URL)
    .then(response => response.json())
    .then(data => data.map(({ titulo, articulo, img = '../img/no_image.jpg' }) => {
      divNoticias.insertAdjacentHTML('beforeend', 
      `
        <div class='noticia'>
          <img src=${img} width='550px'>
          <h2 class='titulo'>
            ${titulo}
          </h2>
          <p class='articulo'>
          ${articulo}
          </p>
        </div>
      `);
    }))
    .catch(error => console.log(error));

    {/* <p>
      <a class='url' href=${url} target='_blank'>
        ${url}
      </a>
    </p> */}