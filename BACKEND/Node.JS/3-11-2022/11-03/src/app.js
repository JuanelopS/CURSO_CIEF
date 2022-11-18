/* JUAN GAVIRA */

import express from 'express';
import router from './routes/clinica.routes.js';

const app = express();

app.use(router);

app.get('*', (req, res) => {
  res.status(404).send('404:recurso no encontrado');
});

app.listen(3000, () => console.log('Escuchando en el puerto 3000...'));