const { argv } = require("process");
const fs = require('fs');

// Leemos el fichero JSON y lo convertimos en un objeto para pasar los idiomas, los pasaremos como ${miJSON[argv[3]]}
const miJSON = JSON.parse(fs.readFileSync('config/idiomas.json', 'utf-8'));


let tabla = `================================
== ${miJSON[argv[3]]} ${argv[2]} ==
  ===============================\n`;

for (i = 1; i <= 10; i++) {
    tabla += `${argv[2]} x ${i} = ${argv[2] * i}\n`
};


tabla += `================================`;



console.log(tabla)    // Vemos la tabla en consola

fs.writeFile(`tabla_multiplicar_${argv[2]}.txt`, tabla, (error) => {
    if (error) {
        throw error;                                                        // Crea un fichero con la tabla de multiplicar de dicho numero
    }
    console.log('Fichero creado');
});
