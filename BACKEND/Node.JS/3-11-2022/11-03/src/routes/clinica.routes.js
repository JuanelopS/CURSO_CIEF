/* JUAN GAVIRA */

import express from 'express';
import { showAllPatients, showPatientNif, addPatientPost, modifyPatient, deletePatient, genderPatients, orderByLastName } from '../controllers/clinica.controller.js';

const router = express();
router.use(express.json());


// ! 1) Ver todos los pacientes mediante la ruta http://localhost:3000/api/pacientes

router.get('/api/pacientes', showAllPatients);

// ! 2) Filtrar los pacientes por su NIF http://localhost:3000/api/pacientes/nif

router.get('/api/pacientes/:nif', showPatientNif);

// ! 3) Añadir pacientes por post en la url http://localhost:3000/api/pacientes

router.post('/api/pacientes', addPatientPost);

// ! 4) Modificar pacientes por patch en la url http://localhost:3000/api/pacientes/nif

router.patch('/api/pacientes/:nif', modifyPatient);

// ! 4) Borrar pacientes por delete en la url http://localhost:3000/api/pacientes/nif

router.delete('/api/pacientes/:nif', deletePatient);

// ! 5) Mostrar la cantidad de pacientes de cada género en la url http://localhost:3000/api/genero

router.get('/api/genero', genderPatients);

// ! 6) Mostrar los pacientes ordenados por apellido en la url http://localhost:3000/api/apellidos

router.get('/api/apellidos', orderByLastName);


export default router;


