const lista = document.querySelector('#lista');

const arrayMarcas = ['Seat', 'Audi', 'Fiat', 'Ford'];

// Método 1:

// arrayMarcas.forEach( marca => {
//   const li = document.createElement('li');
//   li.textContent = marca;
//   li.classList.add('marcas');
//   lista.appendChild(li);
// });

// Método 2:

// arrayMarcas.forEach( marca => {
//   lista.innerHTML += `<li class='marcas'>${marca}</li>`;
// });

// Método 3:

// let listaInner = "";

// arrayMarcas.forEach( marca => {
//   listaInner += `<li class='marcas'>${marca}</li>`;
// });

// lista.innerHTML = listaInner;

// let listaOuter = `<ul class="ul-outer">`;

// arrayMarcas.forEach( marca => {
//   listaOuter += `<li class='marcas'>${marca}</li>`;
// });
// listaOuter += `</ul>`;

// lista.outerHTML = listaOuter;

// const fragment = document.createDocumentFragment();
// // const fragment2 = new DocumentFragment();

// arrayMarcas.forEach( marca => {
//   const li = document.createElement('li');
//   const em = document.createElement('em');
//   const span = document.createElement('span');

//   em.textContent = `Nombre: `;
//   em.style.color = "green";
//   span.classList.add('marcas');
//   span.textContent = marca;
//   li.appendChild(em);
//   li.appendChild(span);
//   fragment.appendChild(li);

// });

// lista.appendChild(fragment);

const template = document.getElementById('template').content;
const fragment = document.createDocumentFragment();
// console.log(template);

arrayMarcas.forEach( marca => {
  template.querySelector('span').textContent = marca;
  const clone = template.cloneNode(true);
  fragment.appendChild(clone);
});

lista.appendChild(fragment);


