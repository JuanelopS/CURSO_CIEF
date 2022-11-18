const numbers = [1, 2, 3, 4, 5, 6];

const functionDouble = number => number * 2;
const double = numbers.map(functionDouble);
const double2 = numbers.map(function(number){
     return number * 2;
});

console.log(double);
console.log(double2);

const filtered = numbers.filter(number => number < 3);

console.log(filtered);

const reduced = numbers.reduce((previousNumber, currentNumber) => previousNumber + currentNumber);

console.log('La suma de todos los números del array es: ' + reduced);