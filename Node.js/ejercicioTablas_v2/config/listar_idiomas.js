const fs = require('fs');

const idiomas = {
    "cat": "Taula de multiplicar del",
    "esp": "Tabla de multiplicar del",
    "eng": "Multiplication table of"
}

const idiomasString = JSON.stringify(idiomas);

fs.writeFileSync('idiomas.json', idiomasString);