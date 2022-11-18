const test = require('node:test');
const assert = require('node:assert');

const estudiantes = require("../datos/estudiantes.json");

const resultado = estudiantes.sort((a,b) => a.apellidos.localeCompare(b.apellidos));


test('Test orden estudiantes', () => {
  
  assert.equal(resultado[0].nombre,'Irene', 'Error: resultado incorrecto');

});
