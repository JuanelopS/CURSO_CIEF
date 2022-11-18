/* Función para quitar las tildes de los nombres que introduzca el usuario previamente a  la comparación
con la base de datos */

const formatearNombre = nombre => {

  const vocales = {
    'á': 'a',
    'é': 'e',
    'í': 'i',
    'ó': 'o',
    'ú': 'u'
  }

  const regex = /[áéíóú]/ig;
  const sinAcentos = nombre.replace(regex, (letter) => vocales[letter]);

  return sinAcentos;

}

module.exports = formatearNombre;


