const express = require('express');
const cheerio = require('cheerio');
const axios = require('axios');
const { join } = require('path');
const cors = require('cors');   // Cors es para que se pueda abrir desde el live server de Visual Studio

const app = express();
const PORT = 4000;
const URL = 'https://www.lavanguardia.com/';

app.use(cors());

app.use(express.static(join(__dirname, 'public')));


// app.get('/', (req, res) => {
//     res.send('Hola')
// });

app.get('/scraper', (req, res) => {

    axios(URL)
        .then(response => {
            // console.log(response.data);
            const html = response.data;

            const $ = cheerio.load(html);
            // console.log($)

            const noticias = []
            $('.article-module', html).each(function () {                // no puede ser arrow function
                const titulo = $(this).text();
                // console.log(titulo);

                const url = URL + $(this).find('a').attr('href');
                // console.log(url)
                const imagenes = $(this).find('img').attr('data-full-src');

                noticias.push({
                    titulo,
                    url,
                    imagenes
                });


            });

            // console.log(noticias);
            res.json(noticias)
        })
        .catch(err => console.log(err))
});







app.listen(PORT, () => {
    console.log(`Escuchando en el puerto: ${PORT}`)
});
