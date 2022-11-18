const fs = require('fs');
const colors = require('colors');
const os = require('node:os')
const argv = require('yargs').argv;




console.log(argv)

const listaIdiomas = require('./config/idiomas.json');

const sleep = ms => {
  return new Promise(resolve => setTimeout(resolve, ms));
};

const log = async (string, delay) => {
  for (const letra of string){
    process.stdout.write(letra);
    await sleep(Math.random() * delay);
  }
  process.stdout.write('\n');
};

const idiomaPorDefecto = 'esp';

/* formatear a tabla_de_multiplicar_*.txt el nombre del archivo */
const formatearIdioma = idioma => {
  return idioma.split(" ").join("_");
}

/* obtengo los argumentos (desestructuro porque filter devuelve otro array) */
let [ lang ] = process.argv.filter(argument => argument.includes('lang'));
let [ num ] = process.argv.filter(argument => argument.includes('num'));
let inScreen = process.argv.some(argument => argument == '--noconsole'); // some: true / false

/* separo el nombre del argumento de su valor */
lang != undefined ? (lang = lang.split('=')[1]) : lang = idiomaPorDefecto;
num != undefined ? (num = parseInt(num.split('=')[1])) : num = 0;

/* Si se han pasado los argumentos necesarios, el idioma especificado tiene 3 letras y hay numero */
if(process.argv.length > 2 && lang.length === 3 && num > 0){

  /* obtener el lenguaje del archivo json */
  let [ idioma ] = Object.entries(listaIdiomas).filter( ([opcion]) => opcion == lang);

  if(idioma.length != 0){
    let texto = "====================================\n";
    texto += `==== ${idioma[1]} ${num} ====\n`;
    texto += "====================================\n";
    for(let i = 1; i <= 10; i++){
      texto += `\t${num} * ${i} = ${num * i}\n`;
    }
    texto += "====================================\n";

    /* escribir archivo */
    /* mkdirSync fs.mkdirSync(txtDir, {recursive: true}) */

    !fs.existsSync('./resultado') && (fs.mkdirSync('resultado'));
    !fs.existsSync(`./resultado/${lang}`) && (fs.mkdirSync(`./resultado/${lang}`));
    fs.writeFileSync(`./resultado/${lang}/${formatearIdioma(idioma[1])}_${num}.txt`, texto);
    
    /* opción de mostrar por pantalla */
    !inScreen && log(texto .magenta, 10);
    // console.log(process.env.LANG);
  }
  else{
    log("Idioma no disponible o no especificado", 10);
  } 
  
} else {
  log("Faltan parámetros o incorrectos", 10);
}


