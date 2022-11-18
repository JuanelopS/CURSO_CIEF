const persona = {
    "nombre": "Robert",
    "apellido": "De Niro",
    "ciudad": "Nuevo York",
    getNombreCompleto: function(){
        this.nombre + " " + this.apellido;
    }
}

// const nombre = persona.nombre;
// console.log(nombre);

const { nombre, apellido } = persona;
console.log( nombre, apellido );

function miActor(actor) {
    const { nombre, apellido, edad = 70 } = actor;
    console.log(nombre, apellido, edad);
}

miActor(persona);

const arrayCoches = ['Ford', 'Seat', 'Audi'];

let [ Focus, Ibiza, a4 ] = arrayCoches;

console.log(Focus);