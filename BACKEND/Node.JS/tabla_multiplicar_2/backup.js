const fs = require('fs');

const dirBackups = 'backups';

// Leemos el original 
const copia = fs.readFileSync('app.js', 'utf-8');

let numBackups = fs.readdirSync('./backups').length;

!fs.existsSync(dirBackups) && (fs.mkdirSync(dirBackups));

// Escribimos la copia
fs.writeFileSync(`./backups/backup_${numBackups + 1}.js`, copia);



// console.log(numBackups);