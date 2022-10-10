import ApiRest from "./class.api.js";

const btnBuscar = document.getElementById('btnBuscar');
const inputPokemon = document.getElementById('inputPokemon');
const contenedorPokemones = document.getElementById('contenedorPokemones');

// API de Pokémon
const pokeapi = 'https://pokeapi.co/api/v2/pokemon/';
const PokemonObject = new ApiRest(pokeapi);



btnBuscar.addEventListener('click', obtenerPersonaje);

function obtenerPersonaje(e) {
    e.preventDefault();
    let nombrePersonaje = inputPokemon.value;
    PokemonObject.get(nombrePersonaje)
        .then(result => {
            PokemonObject.pintarPersonajes(result, contenedorPokemones)
        });

}