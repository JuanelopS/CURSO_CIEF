const fs = require('fs');

const miJSON = fs.readFileSync('alumnos.json', 'utf-8');
// console.log(JSON.parse(miJSON));
const datos = JSON.parse(miJSON);

const loop = datos.map( ({ nombre, apellido, fecha_nacimiento }, index) => {
  setTimeout( () => {
    // nacidos > 2000
    if(new Date(fecha_nacimiento) > new Date('2000/01/01').getTime()){
        console.log(`${nombre} ${apellido} nació el día ${new Date(fecha_nacimiento).toLocaleDateString()}.`);
    }
  }, 200 * index);
});