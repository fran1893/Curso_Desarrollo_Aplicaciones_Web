import ApiRest from "./class.api.js";

const btnBuscar = document.getElementById('btnBuscar');
const inputPersonaje = document.getElementById('inputPersonaje');
const contenedorPersonajes = document.getElementById('contenedorPersonajes');

// API de Breaking Bad
const breakingBadAPI = 'https://breakingbadapi.com/api/';
const breakingBadObject = new ApiRest (breakingBadAPI);


console.log("🚀 ~ file: main.js ~ line 2 ~ btnBuscar", btnBuscar)
//control + alt + l para usar el turbo console log y crear un console log


btnBuscar.addEventListener('click', obtenerPersonaje);

function obtenerPersonaje(e) {
    e.preventDefault();
    let nombrePersonaje = inputPersonaje.value;
    breakingBadObject.get('characters?name='+nombrePersonaje)
        .then(result =>{
        breakingBadObject.pintarPersonajes(result, contenedorPersonajes)
    });

}