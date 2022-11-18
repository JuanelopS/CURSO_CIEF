

const listaCoches = document.querySelector('#marcas');

const arrayMarcas = Array.from(listaCoches.children);

const marcas = arrayMarcas.map(item => item = item.textContent).sort();

listaCoches.innerHTML = '';
marcas.forEach( item => listaCoches.insertAdjacentHTML('beforeend', `<li>${item}</li>`));


const newList = document.createElement('ul');

marcas.forEach( item => {
  let li = document.createElement('li');
  li.textContent = item;
  newList.appendChild(li);
});

const divPadre = document.querySelector('.primero');

divPadre.replaceChildren(newList);

/* mirar solución correcta en xeted */







