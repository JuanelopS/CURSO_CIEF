import { autores } from './datos.js';
import dividir from './funciones.js';

import { pokeapi } from './fetch.js';

// console.log(dividir(1,2));
// console.log(dividir(1,0));
// console.log(dividir(1,'a'));

// try {
//   console.log(1/'a');
//   throw 'Mi error';
// } catch (error){
//   console.log(error);
// }



// const misDatos = (misAutores) => {
//   return new Promise((resolve, reject) => {
//     let opcion = true;
//     if(opcion){
//       setTimeout(() => resolve(misAutores), 3000);
//     }
//     else{
//       reject('No he encontrado los autores');
//     }
//   })
// }

// misDatos(autores)
//   .then(() => console.log(autores))
//   .catch(error => console.log(error));

// console.log('Estoy haciendo otras cosas');

pokeapi();