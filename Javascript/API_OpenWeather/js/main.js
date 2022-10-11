import ApiRest from "./class.api.js";

const btnBuscar = document.getElementById('btnBuscar');
const inputCiudad = document.getElementById('inputCiudad');
const inputAbreviacion = document.getElementById('inputAbreviacion');
const contenedorTiempo = document.getElementById('contenedorTiempo');

// API de Pokémon
const tiempoAPI = 'https://api.openweathermap.org/';
const tiempoObject = new ApiRest(tiempoAPI);



btnBuscar.addEventListener('click', obtenerTiempo);

function obtenerTiempo(e) {
    e.preventDefault();
    let nombreCiudad = inputCiudad.value;
    let abrPais = inputAbreviacion.value;
    tiempoObject.get('data/2.5/weather?q=' + nombreCiudad + ',' + abrPais + '&APPID=682f68b177f12f83999ce1955ff96567&units=metric')
        .then(result => {
            tiempoObject.pintarTiempo(result, contenedorTiempo)
        });

}