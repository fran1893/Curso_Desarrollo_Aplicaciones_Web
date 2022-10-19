const { argv } = require("process");
const process = require("process");
const fs = require('fs');



let tabla =`================================
    == Tabla de multiplicar del ${argv[2]} ==
    ================================\n`;

for(i=1; i<=10; i ++){
   tabla += `${argv[2]} x ${i} = ${argv[2]*i}\n`
};

    
tabla += `================================`;

// console.log(tabla);


fs.writeFile(`tabla_multiplicar_${argv[2]}.txt`, tabla, (error)=>{
    if (error) {
        throw error;                                                        // Crea un fichero con la tabla de multiplicar de dicho numero
    }
    console.log('Fichero creado');
});


