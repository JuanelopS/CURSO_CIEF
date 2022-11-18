const nombre = [];
const apellido = [];
let respuesta = document.querySelector("#respuesta");

preguntar();

function preguntar() {
  let cont = parseInt(prompt("Cuantos nombres/apellidos quieres almacenar?"));
  if(cont > 0){
        almacenar(cont);
        mostrar();
  }
  else return respuesta.insertAdjacentHTML('beforeend', "No hay usuarios.");
}

function almacenar(cantidad) {
  while (cantidad > 0) {
    let nom = prompt("Introduzca nombre: ");
    nombre.push(nom);
    let ape = prompt("Introduzca apellido: ");
    apellido.push(ape);
    cantidad--;
  }
}

function mostrar() {
  for (let i in (nombre, apellido)) {
    respuesta.insertAdjacentHTML(
      "beforeend",
      nombre[i] + " " + apellido[i] + "<br>"
    );
  }
}



