const { argv } = require("process");
const colors = require('colors');  // Importamos el paquete colores que instalamos por npm para darle color a la consola
const fs = require('fs');

// Leemos el fichero JSON y lo convertimos en un objeto para pasar los idiomas, los pasaremos como ${miJSON[argv[3]]}
const miJSON = JSON.parse(fs.readFileSync('config/idiomas.json', 'utf-8'));

let eleccionIdioma = miJSON[argv[3]];


// Si el idioma que elije el usuario no esta disponible o no lo reconoce termina el progarama y envia mensaje de error.
if(eleccionIdioma == undefined){
    console.log('Language unknown | Idioma desconocido');
    process.exit();
}

// Transformamos el string para que quede en el idioma elegido y en el formato que queremos para el nombre del fichero creado.
let nombreFichero_idioma = eleccionIdioma.split(' ').join('_');

let tabla = `================================
== ${eleccionIdioma} ${argv[2]} ==
  ===============================\n`;



for (i = 1; i <= 10; i++) {
    tabla += `${argv[2]} x ${i} = ${argv[2] * i}\n`
};


tabla += `================================`;


console.log(tabla.rainbow.bold)    // Vemos la tabla en consola con los colores elegidos gracias al paquete 'colors'


//  Crea un fichero con la tabla de multiplicar de dicho numero y lo guarda en su respectiva carpeta
fs.writeFile(`${argv[3]}/${nombreFichero_idioma}_${argv[2]}.txt`, tabla, (error) => {
    if (error) {
        throw error;                                                        
    }
    console.log('Fichero creado'.green.bold);
});
