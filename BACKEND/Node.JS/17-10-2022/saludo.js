function saludar(nombre) {
  console.log(`Hola ${nombre}`);
}


function buenasTardes(){
  return "Buenas tardes";
}

// exports.miSaludo = saludar;
// exports.saludoTardes = buenasTardes;

module.exports = {
  saludoNombre: saludar,
  saludoTardes: buenasTardes
}

