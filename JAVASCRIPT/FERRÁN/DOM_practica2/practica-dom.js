window.onload = () => {

// 1:
  const green = document.createElement('li');
  green.textContent = 'green';
  const colores1 = document.querySelector('.colores-1');
  colores1.appendChild(green);

// 2:
  const coral = colores1.children.item(2);
  colores1.removeChild(coral);

// 3:
  const brown = document.createElement('li');
  brown.textContent = 'brown';
  colores1.children.item(1).insertAdjacentElement('afterend', brown);

// 4:
  const button4 = document.querySelector('#button-4');
  const colores2 = document.querySelector('.colores-2').children;
  let contador = 0;

  button4.addEventListener('click', () => {
    
    /* si contador es mayor al número de elementos de la lista (length - 1), se resetea 
    y pongo el ultimo elemento en negro para empezar desde el principio */
    
    if(contador > colores2.length - 1){
      contador = 0;
      colores2[colores2.length - 1].style.color = 'black';
    }
    
    /* coloreo el elemento que le toca en la lista según el contador */
    
    colores2[contador].style.color = colores2[contador].textContent;

    /* devuelvo al color negro el elemento anterior (contador-1) sólo si 
    no es el primero de la lista (no existe anterior a 0) */

    contador > 0 && (colores2[contador-1].style.color = 'black');

    /* avanzo el contador */
    contador++;

  });
    

  //5:
  const button5 = document.querySelector('#button-5');
  const colores3 = document.querySelector('.colores-3');
  const colores = Array.from(colores3.children);
  button5.addEventListener('click', () => {

  colores.forEach( (color, indice) => {
    setTimeout(() => color.style.color = color.textContent, indice * 1000);
  });

  });

  //6:
  const checkbox = document.querySelector('#acepto');
  const buttonDisabled = document.querySelector('#mi-formulario button');
  checkbox.addEventListener('click', () => {
    if(checkbox.checked) buttonDisabled.removeAttribute('disabled');
    else buttonDisabled.disabled = true;

  });

  //7:
  const imgKiwi = document.querySelector('[tipo=kiwi]');
  imgKiwi.addEventListener('click', () => {
    const frutas = document.querySelector('#frutas');
    const kiwi = imgKiwi.getAttribute('tipo');
    
    const li = document.createElement('li');
    li.textContent = kiwi;
    
    frutas.appendChild(li);
  });



}