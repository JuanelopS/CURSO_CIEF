const fs = require('fs');

let operador = process.argv[2];

let texto = "====================================\n";
texto += `Tabla de multiplicar del ${operador}\n`;
texto += "====================================\n";

for(let i = 1; i <= 10; i++){
  texto += `\t${operador} * ${i} = ${operador * i}\n`;
}

texto += "====================================\n";

fs.writeFileSync(`tabla_multiplicar_${operador}.txt`, texto);

// console.log(texto);