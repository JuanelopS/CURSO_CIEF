const express = require('express');
const path = require('path');

const app = express();
const PORT = 4000;
const dirHTML = 'public';

app.use(express.static(dirHTML));
app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'ejs');

app.get('/', (request, response) => {
  response.sendFile(dirHTML, { root: __dirname });
})


app.post('/welcome', (request, response) => {
  // console.log((request.body));
  const { name, email, message } = request.body;

  const html = `
    <h2>Bienvenido ${name} (${email})</h2>
    <p>Mensaje: ${message}</p>
    <marquee direction='right'><h1>JUAN</h1></marquee>
    <marquee ><h1>JUAN</h1></marquee>
    <marquee direction='right'><h1>JUAN</h1></marquee>
    <marquee ><h1>JUAN</h1></marquee>
    <marquee direction='right'><h1>JUAN</h1></marquee>
    <marquee ><h1>JUAN</h1></marquee>
    <marquee direction='right'><h1>JUAN</h1></marquee>
    <marquee ><h1>JUAN</h1></marquee>
    <marquee direction='right'><h1>JUAN</h1></marquee>
    <marquee ><h1>JUAN</h1></marquee>
  `;

  response.send(html);
  
});

app.get('*', (request, response) => {
  response.status(404).send('<h2>404 - Página no encontrada</h2>')
});

app.listen(PORT, () => {
  console.log('Listen at port 4000...');
});
