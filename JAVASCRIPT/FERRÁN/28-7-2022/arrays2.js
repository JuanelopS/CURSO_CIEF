let frutas = ['Peras', 'Cerezas', 'Limones'];

frutas.push('Naranjas');

console.log("Despues de frutas.push('Naranjas'), el array es ", frutas);

frutas.pop();

console.log("Despues de frutas.pop(), el array es ", frutas);

frutas.shift();

console.log("Despues de frutas.shift(), el array es ", frutas);

frutas.unshift('Mango');

console.log("Despues de frutas.unshift('Mango'), el array es ", frutas);

// Unir arrays

let frutasTotal = frutas.concat(frutas2);

let frutasTotal2 = [...frutas, ...frutas2];  //...spread o propagación

frutas = [].concat(frutas, frutas2); 




