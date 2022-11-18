

console.log(Array.from([1, 2, 3], x => x * x));
// output: Array [2, 4, 6]

// no devuelve valores repetidos en el array
const set = new Set([1, 2, 3, 3, 5, 3, 1]);
console.log(Array.from(set));
// output: [1, 2, 3, 5]
