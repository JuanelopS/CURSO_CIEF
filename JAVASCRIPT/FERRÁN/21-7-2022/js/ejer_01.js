let numeros = [1, 2, 3, 4];
let respuesta = document.querySelector("#respuesta");

respuesta.insertAdjacentHTML(
  "beforeend",
  "Método 1: " + sumar(numeros) + "<br>"
);
// respuesta.insertAdjacentHTML("beforeend", "Método 2: " + sumatorio2);
respuesta.insertAdjacentHTML("beforeend", preguntar());

// Primer método
function sumar(arr) {
  let acumulador = 0;
  for (let i in arr) acumulador += arr[i];
  return acumulador;
}

// Segundo método
// let acumular = (acumulado, item) => item + acumulado;
// let sumatorio2 = numeros.reduce(acumular);

function preguntar() {
  let newArray = [];
  let num;
  // mientras el usuario no pulse 'n'...
  while (num != "n") {
    num = prompt("Introduce un número o 'n' para salir: ");
    // si la función filtrar devuelve true, pusheamos num
    if (filtrar(num)) newArray.push(parseInt(num));
  }
  respuesta.insertAdjacentHTML("beforeend", "[" + newArray + "] = ");
  // devuelvo el array relleno y lo paso a la función sumar como argumento.
  return sumar(newArray);
}

function filtrar(item) {
  // si item no es un número lo devolvemos para que preguntar() lo
  // inserte en el array
  if (!!item && /\d/.test(item)) return item;
  else if (item === "n") alert("HASTA LUEGO!");
  else return alert("NO HAS INTRODUCIDO UN NÚMERO!");
}


