const divNoticias = document.getElementById('noticias');

const URL = 'http://localhost:4000/scraper'

fetch(URL)
    .then(response => {
        return response.json()
    })
    .then(data => {
        // console.log(data);
        data.forEach(noticia => {
            const articulo = '<h2>' + noticia.titulo + '</h2>'
            const enlace = '<a href="' + noticia.url + '">' + noticia.url + '</a>'
            const imagen = '<br><br><img src="' + noticia.imagenes + '" alt="" width="300px">'
            divNoticias.insertAdjacentHTML('beforeend', articulo);
            divNoticias.insertAdjacentHTML('beforeend', enlace);
            divNoticias.insertAdjacentHTML('beforeend', imagen)
        });
    })
    .catch(err => console.log(err))