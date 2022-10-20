const fs = require('fs');

// Directorio de las copias
const dirBackups = 'backups';

// Leemos el original
const copia = fs.readFileSync('app.js', 'utf-8');

// Verificamos si existe el directorio si no lo creamos
if (!fs.existsSync(dirBackups)){
    fs.mkdirSync(dirBackups);
}

// Leemos el contenido de la carpeta backups
const contenidoCarpeta = fs.readdirSync('./backups');


// Escribimos una copia del fichero original tantas veces como corramos el programa
fs.writeFileSync(`backups/backup_${contenidoCarpeta.length + 1}.js`, copia);
