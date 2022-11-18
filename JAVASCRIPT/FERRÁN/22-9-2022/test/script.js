window.onload = () => {

  const div1 = document.querySelectorAll('.divs').item(0);
  const div2 = document.querySelectorAll('.divs').item(1);
  const lista1 = document.querySelectorAll('.listas').item(0);
  const lista2 = document.querySelectorAll('.listas').item(1);
  const boton1 = document.querySelector('#boton1');
  const boton2 = document.querySelector('#boton2');
  const resultado = document.querySelector('#resultado');

  const cambiarLista = indice => lista1.children[indice].textContent = lista2.children[indice].textContent;


  boton1.addEventListener('click', () => {

    const elemento = document.querySelectorAll('li:nth-child(2)').item(1);
      
    elemento.style.color = 'red';

    resultado.insertAdjacentHTML('beforeend', div1.classList);
  
    Array.from(lista1.children).forEach( (item, index) => cambiarLista(index));

  });

  
  boton2.addEventListener('click', () => {

    const filas = [...lista2.children].reverse();
    filas.map(item => lista2.appendChild(item));

  });


}
