// Regentamos una pizzeria que ofrece pizzas a gusto del consumidor.

// Por tanto necesitamos un menú para que elija:

// 1) el tipo de masa: solo puede elejir uno

// 2) los ingredientes: puede elegir cualquiera de ellos, incluso  más de uno, pero solo una vez cada uno.

// cada ingrediente debe mostrar su precio incrementado un 20% de beneficio + 25% gastos diversos, todo ello por un 4% de IVA
// (estos porcentajes no los ve el cliente)

// Al final aparece el contenido del pedido y el precio total.



// sleep / log -> funciones para simular máquina de escribir en el output final

const sleep = ms => {
  return new Promise(resolve => setTimeout(resolve, ms));
};

const log = async (string, delay) => {
  for (const letra of string){
    process.stdout.write(letra);
    await sleep(Math.random() * delay);
  }
  process.stdout.write('\n');
};

// log('Hola mundo', 100, true);


const { condimentos, masa } = require("./ingredientes.js");

/* https://www.geeksforgeeks.org/node-js-readline-module */
const readline = require('readline');
const rl = readline.createInterface({input: process.stdin, output: process.stdout});

let pizza = [];
let ingredientes = [];
let precioIngrediente = [];
let total = 0;

Object.entries(condimentos[0]).forEach( value => {
  ingredientes = [...ingredientes, value[0]];
  precioIngrediente = [...precioIngrediente, parseFloat(value[1]).toFixed(2)];
});

const pintarIngredientes = () => {
  console.log("Lista de Ingredientes:", '\n');
  ingredientes.forEach((ingrediente, index) => {
    console.log(
      `${index + 1}: ${ingrediente} -> ${precioIngrediente[index]}`
    );
  });
  console.log('\n');
  
}

// loop mediante recursividad hasta que se pulse 'n'

const pedirIngrediente = () => {

  // hasta que no haya respuesta se paraliza la ejecución
  rl.question('Añada un ingrediente de la lista o escriba \'n\' para salir: ', respuesta => {
    if(respuesta != 'n'){
      pintarIngredientes();
      if(parseInt(respuesta) >= 1 && parseInt(respuesta) <= ingredientes.length){
        total += parseFloat(precioIngrediente[respuesta - 1]);
        pizza = [...pizza, ingredientes[respuesta - 1]];
        console.log(`Añadiendo ingrediente ${ingredientes[respuesta - 1]}...`,'\n');
      }
      console.log('Tu pizza: ');
      console.log(`Masa: ${pizza[0]}`);
      console.log(`Ingredientes: ${pizza.slice(1)}`);
      console.log(`subTotal: ${(total * 1.45).toFixed(2)}€`,'\n');
      // console.log(pizza, total);
      pedirIngrediente(); // función recursiva hasta que se escriba 'N';
    } else {
      console.log("Espere un momento por favor....");
      let contador = 10;
      let loading = ['|', '/', '-', '\\', '|', '/', '-', '\\', '|', '/', '-'];
      const espera = setInterval(() => {
        if(contador > 0) {
          readline.cursorTo(process.stdout, 0, 0);
          readline.clearScreenDown(process.stdout);
          readline.clearLine(process.stdout, 0);
          process.stdout.write(contador.toString() + " " + `${loading[contador]}`);
          contador--;
        }
        else{
          readline.clearLine(process.stdout, 0);
          process.stdout.write("Listo!");
          console.log('\n\n');
          log(`Su pizza de masa ${pizza[0]} con ${pizza.slice(1, -1)} y ${pizza.slice(-1)} está lista. Son ${(total * 1.45 * 1.04).toFixed(2)}€ (IVA inc). Gracias!`, 60);
          clearInterval(espera);
          return rl.close();
        }
      }, 400);
    }
  });

}

  /* (respuesta - 1) -> es porque en el menú se muestran los índices + 1 (para no presentarlos desde el 0) */

  console.log('\n',"*** BIENVENIDO A MI PIZZERIA BAMBIN@ ***", '\n');
  console.log("Tipos de masa: ", '\n');
  masa.forEach((pizza, index) => console.log(`${index + 1} - ${pizza.tipo}`));
  console.log('\n');

  // elección de masa

  rl.question('¿Qué tipo de masa desea?: ', respuesta => {
      if (respuesta == 1 || respuesta == 2 || respuesta == 3){
        console.log('\n',`Ha elegido usted masa ${masa[respuesta - 1].tipo}!`,'\n');
        // actualizo el total a pagar
        total += parseFloat(masa[respuesta - 1].precio);
        pizza = [...pizza, masa[respuesta - 1].tipo];
        // console.log(pizza, total);
        // elección de ingrediente
        pintarIngredientes();
        // llamo a esta función que hará un loop hasta que se escriba 'N'
        pedirIngrediente();
      } 
      else {
        console.log('No existe esa masa: Byes...');
        rl.close();
      }
  });

  
