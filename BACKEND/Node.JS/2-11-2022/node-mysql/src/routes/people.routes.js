import express from 'express';
import { selectPeople, insertPeople, getPerson, updatePerson, deletePeople, patchPeople } from '../controllers/people.controller.js';

const router = express();

// router.use(express.urlencoded({extended: true}));
router.use(express.json());

// router.get('/test', getTest);

// ! GET -> MOSTRAR
router.get('/api/people', selectPeople);
router.get('/api/people/:id', getPerson);

// ! POST -> AÑADIR
router.post('/api/people', insertPeople);

// ! PUT -> MODIFICAR EL REGISTRO ENTERO
router.put('/api/people/:id', updatePerson);

// ! PATCH -> MODIFICAR UN VALOR DE UN REGISTRO
router.patch('/api/people/:id', patchPeople);

// ! DELETE -> ELIMINAR REGISTRO
router.delete('/api/people/:id', deletePeople);


export default router;




// router.get('/test',(request, response) => {
//   const [ rows ] = pool.query('SELECT * FROM people', (error) => {
//       if(error) return response.status(500).send('Ooops! Ha habido un error...');
//       else response.send(rows);
//   });
// });