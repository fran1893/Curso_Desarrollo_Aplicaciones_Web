const veces = parseInt(prompt("¿Cuantas personas deseas añadir?"));

if (veces <= 0) { alert("No hay usuarios") };

let nombre = [];
let apellido = [];

for (let i = 0; i < veces; i++) {
    let texto_nombre = prompt("Introduzca un nombre");
    let texto_apellido = prompt("Introduzca un apellido")

    nombre.push(texto_nombre);
    apellido.push(texto_apellido);
};

let usuario = "";

for (let i = 0; i < veces; i++) {

    usuario = usuario + apellido[i] + ", " + nombre[i] + "<br>";

    document.getElementById("respuesta").innerHTML = usuario;
};


console.log(nombre);
console.log(apellido);