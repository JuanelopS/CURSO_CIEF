// Ejercicios arrays

// 1:Crea un array para albergar al menos 10 números enteros aleatorios entre 1 y 20, luego rellena el array con ellos. 
// El ejercicio trata de crear a partir de este array otros dos uno con los números pares y otro con los impares. 
// No debes usar bucles, usa el método del array que creas más apropiado.

const arrayRandom = [];
for(let i = 0; i < 10; i++) arrayRandom.push(Math.ceil(Math.random() * 20)); // randoms 1 - 20
console.log(arrayRandom);

// 1a: pares
const arrayRandomPares = arrayRandom.filter(item => item % 2 == 0); //divisible entre 2 -> par
console.log(arrayRandomPares);
// 1b: impares
const arrayRandomImpares = arrayRandom.filter(item => item % 2 != 0); //no divisible -> impar
console.log(arrayRandomImpares);


// 2: Crea un array de al menos 10 elementos para guardar números enteros. Usa un método para obtener la suma de los números pares y la de los números impares.

const arrayEnteros = [];
for(let i = 0; i < 10; i++) arrayEnteros.push(Math.ceil(Math.random() * 20)); // randoms 1 - 20
//2a: suma pares
const sumaPares = arrayEnteros.filter(item => item % 2 == 0) 
                              .reduce((acum, item) => acum + item);
//2b: suma impares
const sumaImpares = arrayEnteros.filter(item => item % 2 != 0) 
                                .reduce((acum, item) => acum + item);

                            
// 3: Tienes que crear un script que gestione una lista de la compra. Para ello tienes dos listas de artículos: compra, pendiente. Cada elemento de la lista compra es un objeto con dos propiedades: nombre del artículo y estado. Estado es un booleano true si el artículo se compró, false en caso contrario. Pendiente es una lista con los nombres de los artículos que faltan por comprar. La función que debes crear recibe como argumento la lista de compra y devuelve la lista de pendientes.

const compra = [
  { nombre: "naranja", estado: true },
  { nombre: "manzana", estado: false },
  { nombre: "pera", estado: true },
  { nombre: "fresa", estado: false },
];

// const pendiente = comprobarPendientes(compra);
// function comprobarPendientes(array){
//     return array.filter(item => item.estado == false);
// }

// const pendiente = compra.filter(item => item.estado == false);

const pendiente = (arg) => arg.filter(item => item.estado == false);
console.log(pendiente(compra));


// 4: 
// Tienes una lista de objetos con los nombres de los miembros de una familia. 
// Este script debe devolver dos objetos con el nombre y edad del miembro de mayor edad y del de menor edad.

let familia = [
{nombre:'Juan', edad: 34}, 
{nombre:'Pepa', edad: 40}, 
{nombre:'Ana', edad: 12},
{nombre:'Luis', edad: 14} 
];

function minMaxEdad (array){
    let maxEdad = array.reduce((prev, item) => {
        if(prev.edad > item.edad) return prev;
        else return item;
    });

    let minEdad = array.reduce((prev, item) => {
        if(prev.edad < item.edad) return prev;
        else return item;
    });
    
    return [maxEdad, minEdad];
}

console.log(minMaxEdad(familia));