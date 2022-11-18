window.onload  = () => {

  // EJERCICIO_1

  const filas = document.querySelectorAll('.lista-población-bcn li');
  const lista = document.querySelector('.lista-población-bcn');
  const botonOrdenar = document.querySelector('#button-bcn');

  botonOrdenar.addEventListener('click', () => {

    /* ListaOrdenada -> Paso los elementos li a un array mediante desestructuración [...] 
    y ordeno sus textContent mediante sort() */

    const listaOrdenada = [...filas].map(item => item.textContent).sort();

    /* Borro el contenido de <ul></ul> e introduzco el array ordenado
    dentro de etiquetas li mediante insertAdjacentHTML y un forEach */

    lista.replaceChildren();
    listaOrdenada.forEach( item => { lista.insertAdjacentHTML(
      'beforeend',
      `<li>${item}</li>`
    )});

    /* Vuelvo a introducir los saltos de linea y el botón que había dentro de <ul></ul> */

    lista.insertAdjacentHTML(
      'beforeend', 
      `<br><br>
      <button id="button-bcn">Ordena de menor a mayor</button>`
    );

  });

  // EJERCICIO_2

  const imagenTaza = document.querySelector('#imagen > img');
  const respuesta = document.querySelector('#answer');

  imagenTaza.addEventListener('click', () => {
      let atributo1 = imagenTaza.getAttribute('prop1');
      let atributo2 = imagenTaza.getAttribute('prop2');
      let atributo3 = imagenTaza.getAttribute('prop3');
      let atributo4 = imagenTaza.getAttribute('prop4');

      respuesta.insertAdjacentHTML('beforeend', `${atributo1} ${atributo2} ${atributo3} ${atributo4}`);
      
  });

}
