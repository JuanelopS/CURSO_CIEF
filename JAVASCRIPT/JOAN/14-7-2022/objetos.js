
function Perro(nombre, numPatas)
{
    this.nombre = nombre;
    this.numPatas = numPatas;
}

Perro.prototype.numOjos = 2;

let mastin = new Perro("Terry", 4);
let terrier = new Perro("Bobby", 4);

function Pajaro(nombre, numAlas, vuela)
{
    this.nombre = nombre;
    this.numAlas = numAlas;
    this.vuela = vuela;
}

let canario = new Pajaro("Pedro", 2, true);

console.log(mastin);
console.log(terrier);

