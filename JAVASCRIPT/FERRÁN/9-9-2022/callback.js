// primera();
// segunda();

// function primera (){
//   console.log('Soy la primera');
// }

// function segunda (){
//   console.log('Soy la segunda');
// }

// const tercera = () => console.log('Soy la tercera');

// tercera();

// const cuarta = function(){
//   console.log("Soy la cuarta");
// }

let a = "Buenas ";
let b = "tardes";


function suma(a, b){
  let sum = a + b;
  return sum;
}



let total = suma(a, b);

// salida(total);
// salida(suma(a, b));

function suma2(x, y, callback2){
  
}

// suma2(a, b, salida);

// function suma3(callback3, x, y){
//   let sum = x + y;
//   callback3(sum);
// }

// suma3(a, b, salida);

let frase = "buEnAs tArdeS";

function fraseMinus (texto){
  return texto.toLowerCase();
}

function fraseCapital (texto){
  return texto.charAt(0).toUpperCase() + texto.slice(1);
}

function salida(algo){
  console.log(algo);
}


function fraseCorrecta(frase, callBackMinus, callBackCapital, callBackSalida){
   return callBackSalida(callBackCapital(callBackMinus(frase)));
}

fraseCorrecta(frase, fraseMinus, fraseCapital, salida);

const fraseCorrecta2 = (frase, callBackMinus, callBackCapital, callBackSalida) => callBackSalida(callBackCapital(callBackMinus(frase)));

fraseCorrecta2(frase, fraseMinus, fraseCapital, salida);



