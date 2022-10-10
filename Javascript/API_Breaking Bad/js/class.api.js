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
    pintarPersonajes (listaPersonajes, objetoDOM) {
        console.log(listaPersonajes);

        objetoDOM.innerHTML = '';

        for (let personaje of listaPersonajes){
            objetoDOM.innerHTML += `
            <div class="col col-sm-4">
            <div class="card">
                <img src="${personaje.img}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Nombre :${personaje.name}</h5>
                    <p class="card-text">Actividad :${personaje.occupation}</p>
                    <p class="card-text">Estado :${personaje.status}</p>
                </div>
            </div>
        </div>
            `;
        }
    }

}