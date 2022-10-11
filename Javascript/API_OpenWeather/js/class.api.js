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
    pintarTiempo(listaTiempo, objetoDOM) {
        console.log(listaTiempo);

        objetoDOM.innerHTML = `
                <h1 class="text-center">${listaTiempo.name} / ${listaTiempo.sys.country}</h1>
                <h2 class="text-center">${listaTiempo.weather[0].main}</h2>
                <h3 class="text-center">${listaTiempo.main.temp} ºC</h3>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item text-center">Humedad: ${listaTiempo.main.humidity}%</li>
                    <li class="list-group-item text-center">Viento: ${listaTiempo.wind.speed} m/s</li>
                </ul>
            `;
    }

}