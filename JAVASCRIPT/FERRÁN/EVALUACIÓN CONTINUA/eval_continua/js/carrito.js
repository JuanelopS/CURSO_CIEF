/*
Hay que programar un carrito de compra de fruta.

El cliente eligirá que fruta quiere haciendo click sobre la imagen.
Un mensaje emergente le preguntará qué cantidad quiere.

Esta información se mostrará debajo de "Total carrito", 
en <p id="carrito"></p>, de esta forma:
 Kiwi 2 kg x 4,20€/kg = 8,40 €
 Total Compra: 8,40€
 
Se dará la opción de añadir o no más productos que se mostrarán
a continuación de los anteriores, y se sumará todo en el total. 
Por ejemplo:  
 Kiwi 2 kg x 4, 20€/kg = 8, 40€
 Pomelo 1 kg x 2,50€/kg = 2,50€
 Total Compra: 10,90€


 Lo importante es el cálculo, no los estilos css
 */

/* Este array 2D guarda los valores nombre, precio y tipo de unidad que se le pasaran a la función AddPurchase  */
const arrayFruits = [
  ["Pomelo", 2.50, "kg"],
  ["Kiwi", 4.20, "kg"],
  ["Limón", 1.20, "kg"],
  ["Piña", 2.80, "ud"],
  ["Sandía", 1.20, "kg"],
];

/* Mediante este bucle le asigno a cada imagen (querySelectorAll[i]) un evento click, 
   que llamará a la función addPurchase pasándole como parámetro un array almacenado 
   en arrayFruits */
const imageFruits = document.querySelectorAll(".imatges");
for (let i in arrayFruits){
      imageFruits[i].onclick = () => addPurchase(arrayFruits[i]);
      // console.log(arrayFruites[i]);
}

// arrays donde iré almacenando, respectivamente, las distintas compras y lo pagado por las mismas.

const totalCart = [], totalPurchase = [];

/* - addPurchase: función principal
   - el párametro typeCount -> kg o unidades(pinya)
   - "pusheo" al array totalCart los strings de las compras y al array totalPurchase la 
      cantidad que cuesta cada compra. 
   (el parámetro de esta función es un array que pertenece a arrayFruits) */

function addPurchase([fruit, price, typeCount]) {
  // console.log(fruit, price, typeCount);

  /* la función checkCount comprueba si se ha introducido una cantidad válida */
  let count = parseInt(prompt(`¿Qué cantidad de ${fruit} desea?`));
  if (checkCount(count)){
      totalCart.push(`${fruit} ${count} x ${price}/${typeCount} = ${(count * price).toFixed(2)}€`);
      totalPurchase.push(parseFloat((count * price).toFixed(2)));
      // console.log(typeof totalPurchase[0]) 

      // hago visible/actualizo el carrito de la compra
      showPurchase();
  }
  else alert("No ha introducido una cantidad válida");
}

/* ckeckCount: función que comprueba si la cantidad introducida por el usuario es "válida", entendiendo 
   como válida que no sea undefined o NaN, mayor que 0 y que sea un número (regex /\d/) */

function checkCount(num) {
  if (!!num && num > 0 && /\d/.test(num)) return true;
  else return false;
}

/* showPurchase: Con un for...in recorro todo el array donde he ido almacenando las compras, y lo muesto en 
   "carrito".  Asimismo, añado un botón a cada compra con la función deletePurchase para eliminar compras */

function showPurchase() {

  let cart = document.querySelector("#carrito");

  /* Borro todo el contenido anterior para que no se concatene con la siguiente actualización del carro */
  cart.innerHTML = "";

  /* La variable i me sirve además para el id del párrafo, para poder apuntar al mismo si quiero borrar 
     la compra. La clase de la etiqueta i es un simple icono de papelera del css de Font Awesome */
  for (let i in totalCart) {
    cart.insertAdjacentHTML(
        "beforeend", 
        `<p id="${i}"><i class="fa-solid fa-trash-can"  id="borrar" onclick="deletePurchase(${i})"></i>${totalCart[i]}</p>`);
  }
  /* Muestro el total de la compra llamando a la función calculateTotal (si es mayor que 0 puesto que el método reduce
     de dicha función provoca un error si el array está vacío (sin compras)) */
  if (totalCart.length > 0){  
    cart.insertAdjacentHTML(
      "beforeend",
      `<div id="totalCompra"><span id="total"><i class="fas fa-shopping-cart fa-sm"></i>  Total Compra: ${calculateTotal()}€</span></div>`);
  }
}

/* calculateTotal: función que mediante un simple reduce devuelve la suma de todos los elementos del array totalPurchase. El método indexTo -> para mostrar 2 decimales únicamente en los precios */

function calculateTotal() {
        return totalPurchase.reduce((acum, item) => acum + item).toFixed(2);
}

/* deletePurchase: función que sirve para eliminar elementos del carrito mediante el método
   splice. El párametro position es la id que se le ha ido asignando a cada compra en la 
   función showPurchase */

function deletePurchase(position){
    // console.log(position);
    totalCart.splice(position, 1);
    totalPurchase.splice(position, 1);
    showPurchase();
}


