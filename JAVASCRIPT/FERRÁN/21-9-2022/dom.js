// const lista = document.querySelectorAll('.lista').item(0);
// console.log(lista.children[3].textContent);

const lista = document.querySelector('.lista');

const newElement = document.createElement('li');
newElement.textContent = 'Cactus';
newElement.className = 'flor';
newElement.onclick = () => {
    newElement. style.color = 'red';
    newElement.style.fontSize = '2rem';
};

const newButton = document.createElement('button');
newButton.textContent = 'Botón';

const prueba = document.querySelector('header');

prueba.insertAdjacentElement('afterend', newButton);


// lista.appendChild(newElement);

// lista.removeChild(newElement);

// lista.insertAdjacentElement('beforebegin', newElement);
lista.insertAdjacentElement('beforeend', newElement);
// lista.insertAdjacentElement('afterbegin', newElement);
// lista.insertAdjacentElement('afterend', newElement);

const newFlower = document.createElement('li');
newFlower.textContent = '<p>Amapola</p>';
newFlower.style.backgroundColor = 'blue';
newFlower.style.color = 'white';

// const lista2 = lista.cloneNode(true);
// lista.insertAdjacentElement('afterend', lista2);


