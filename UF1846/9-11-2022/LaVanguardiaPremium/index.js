const express = require('express');
const cors = require('cors');
const cheerio = require('cheerio');
const axios = require('axios');
const { join } = require('path');

const app = express();
const PORT = 4000;
const URL = 'https://www.lavanguardia.com/cultura/20221109/8600103/primera-oracion-escrita-conocida-suplica-erradicar-piojos.html';

app.use(cors());
app.use(express.static(join(__dirname, 'public')));

// app.get('/', (req, res) => {
//     res.send("Hola");
// })

app.get('/scraper', (req, res) => {

// contenido de la noticia
// #main-container > div.main-article-container > article > div.container > div.row > div.article-content.col-12.col-md-8 > div.article-modules

// imagen de cabecera
// #main-container > div.main-article-container > article > div.container > div.row > header > div > div.article-media-main > figure > picture > img

// titulo de la noticia
// #main-container > div.main-article-container > article > div.container > div.row > header > div.article-top > div > div.title-container > h1


    axios(URL)
        .then(response => {
            //console.log(response.data);
            const html = response.data;

            const $ = cheerio.load(html)

            let noticias = [];
            $('#main-container', html).each(function () {
                const titulo = $(this).find('div.main-article-container > article > div.container > div.row > header > div.article-top > div > div.title-container > h1').text().trim();
                // const url = URL + $(this).find('.article-details > h2 > a').attr('href');
                const img = $(this).find('div.main-article-container > article > div.container > div.row > header > div > div.article-media-main > figure > picture > img').attr('data-full-src');
                const articulo = $(this).find('div.main-article-container > article > div.container > div.row > div.article-content.col-12.col-md-8 > div.article-modules').html();
                noticias = [...noticias, { titulo, articulo, img } ];
            })
            /* $('.image-container > picture', html).each(function() {
              const image = 
              imagenes = [...imagenes, image];
            }) */

            res.json(noticias);
        })
        .catch(err => console.log(err))
})

app.listen(PORT, () => console.log(`Escuchando en el puerto ${PORT}`))