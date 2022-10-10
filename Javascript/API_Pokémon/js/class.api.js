export default class ApiRest {

    constructor(urlBase) {
        this.urlBase = urlBase;
    }

    async get(endPoint) {

        const url = this.urlBase + endPoint;

        const peticion = await fetch(url, {
            method: 'GET',
            headers: {
                "Accept": "application/json"
            }
        })

        if (peticion.status === 200) {
            let json = await peticion.json();
            // Cuando todo va ok:
            return json;
        } else {
            return peticion.statusText;
        }
    }

    // Qué queremos mostrar y donde
    pintarPersonajes (listaPokemon, objetoDOM) {
        console.log(listaPokemon);

            objetoDOM.innerHTML += `
            <div class="col col-sm-4">
            <div class="card">
                <img src="${listaPokemon.sprites.other.dream_world.front_default}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Nombre:  ${listaPokemon.name}</h5>
                    <p class="card-text">Tipo:  ${listaPokemon.types[0].type.name}</p>
                    <p class="card-text">Ataque Principal:  ${listaPokemon.moves[0].move.name}</p>
                </div>
            </div>
        </div>
            `;
    }

}