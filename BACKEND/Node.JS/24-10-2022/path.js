const path = require('path');

// console.log(path);

console.log(path.sep);

const ruta = 'dir/users/alumno/css/main.js';

console.log(path.dirname(ruta));
console.log(path.basename(ruta));
console.log(path.extname(ruta));
const parsed = path.parse(ruta);
console.log(parsed.dir, parsed.base, parsed.ext, parsed.root);

// obtiene la ruta absoluta y se le puede añadir más
console.log(path.resolve(path.dirname(ruta), 'alumnos/informes'));
console.log(path.resolve('alumnos/informes'));