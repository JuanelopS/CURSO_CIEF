const test = require('node:test');
const assert = require('node:assert');

test('Ejemplo de test', () => {
    
    // ! Equal admite 3 parámetros -> el valor esperado, el valor que llega y el mensaje en caso de error
    assert.equal(1, 1, "No son iguales");

    assert.equal(21, calculaEdad('2000-11-12'), 'No son iguales');

});

// ! Testear objetos -> 3 parámetros igual
test('Testear objetos', () => {
  assert.deepEqual({ nombre: 'María' }, { nombre: 'María' }, 'Error en el objeto');
});

// ! strictEqual si distingue string de number
test('Testear objetos', () => {
  assert.strictEqual({ numero: 1 }, { numero: '1' }, 'Error en el objeto');
});


console.log("1/0", 1/0);
test('Testeo resultado Infinity', () => {
    assert.deepEqual('Infinity', 1/0, 'Error en el objeto');
});




function calculaEdad(fecha) {
    const fechaNacimiento = new Date(fecha)
    const today = new Date();
    const anyoActual = today.getFullYear();
    const anyoNacimiento = fechaNacimiento.getFullYear();
    let edad = anyoActual - anyoNacimiento;

    if (fechaNacimiento.getMonth() > today.getMonth()) {
        edad--;
    } else if (fechaNacimiento.getMonth() == today.getMonth() && fechaNacimiento.getDate() > today.getDate()) {
        edad--;
    }
    return edad;
}

// console.log(calculaEdad('2000-11-12'))