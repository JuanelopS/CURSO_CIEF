let array = [1, 10, 14, 9, 5, 6];
console.log(`array = [${array}]`);

let newArray = array
  .filter((item) => item % 2 != 0) // dejamos en el array únicamente los números impares
  .reduce((acum, item) => acum + item); //sumo todos los números del array resultante

console.log(`Sumar todos los números impares del array: ${newArray}`);

let newArray2 = 0;
for (let i = 0; i < array.length; i = i + 2) { // el array se recorre de 2 en 2 (i = i + 2)
  newArray2 += array[i];
}

console.log(`Sumar todos los valores cuyo índice es par: ${newArray2}`);

let newArray3 = array
  /* dejo en el array solo el índice 0 y pares (_ hace referencia a un valor no usado, 
     ya que no necesito en este paso los valores en sí del array) */
  .filter((_, index) => (index == 0 || index % 2 == 0)) 
  /* devuelvo la suma de todos items restantes (se recorre el array y reduce almacena en
     el primer parámetro el valor anterior) */
  .reduce((acum, item) => acum + item); 

console.log(`Ejercicio anterior de otra manera: ${newArray3}`);
