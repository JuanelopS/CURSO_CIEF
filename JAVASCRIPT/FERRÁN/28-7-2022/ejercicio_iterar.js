// dado este objeto:

let compositores = [
  { nombre: "John Barry", salario: 100000, ciudad: "Londres" },
  { nombre: "James Horner", salario: 90000, ciudad: "Los Angeles" },
  { nombre: "Ennio Morricone", salario: 120000, ciudad: "Roma" },
  { nombre: "Nino Rota", salario: 80000, ciudad: "Roma" },
  { nombre: "Vangelis", salario: 120000, ciudad: "Londres" },
  { nombre: "Hans Zimmer", salario: 120000, ciudad: "Nueva York" },
  { nombre: "John Williams", salario: 120000, ciudad: "Nueva York" },
  { nombre: "Max Steiner", salario: 65000, ciudad: "Nueva York" },
];

// Hay que:

// 1) crear otro array en que los objetos aparezcan 
// con los nombres ordenados de forma descendente.

// 2) crear otro array en que los objetos aparezcan 
// con el salario de forma ascendente (de menos a mayor).

// 3) Crear otro array solo con los músicos de Nueva York

// 4) Obtenr la suma de los salarios de los músicos de Londres


// 1
/* sort ordena los valores de un array mediante una función de comparación entre 2 valores,
   que irá aplicando en todos los valores del array entre sí. Criterios de sort:
 - a < b: la función devuelve -1 (sort necesita <0 para ordenar 'a' delante de 'b' -> "return -1");
 - b > a: la función devuelve 1 -> (sort coloca 'b' delante de 'a')
 - a == b: sort deja en la misma posición ambos valores */
let compositoresNombreDes = [...compositores];

compositoresNombreDes.sort((a, b) => {
    if(a.nombre < b.nombre) return -1;
    if(a.nombre > b.nombre) return 1;
    return 0;
    }).reverse(); // -> para el orden descendente

console.log("Compositores ordenados según su nombre (desc):", compositoresNombreDes);

// 2
/* En el caso de comparar números, la función comparadora solo necesita restar los valores:
   valor negativo (a < b) -> se coloca a delante de b
   valor positivo (a > b) -> se coloca b delante de a
   (a == b) -> se quedan en la mismo posición */
let compositoresSalarioAsc = [...compositores];

compositoresSalarioAsc.sort((a, b) => a.salario - b.salario);
console.log("Compositores ordenados según su salario (asc)", compositoresSalarioAsc);

// 3
let compositoresNy = compositores.filter(item => item.ciudad == "Nueva York"); // condición
console.log("Compositores de New York: ", compositoresNy);

// 4
let sumaSalarios = compositores.filter(item => item.ciudad == "Londres") // condición
                               .reduce((acum, item) => acum.salario + item.salario); // suma de salarios
console.log("Salario total de compositores de Londres: ", sumaSalarios);
