/* JUAN GAVIRA */

import { pool } from '../db_config.js';


export const showAllPatients = async (request, response) => {

  const sql = "SELECT * FROM pacientes";
  
  try {
    const [ result ] = await pool.query(sql);
    response.send(result);
  } catch (error) {
    response.status(500).send('Ooops! Ha habido un error...');
  }

}

export const showPatientNif = async (request, response) => {

  const nifParam = request.params.nif;
  // console.log(nifParam);
  const sql = `SELECT * FROM pacientes WHERE nif = '${nifParam}'`;
  
  try {
    const [ result ] = await pool.query(sql);
    result.length > 0 ?
     (response.send(result))
     :
     (response.send(`No existe usuario con el nif ${nifParam}`));

  } catch (error) {
    response.status(500).send('Ooops! Ha habido un error...');
  }

}

export const addPatientPost = async (request, response) => {

  const { nif, nombre, apellido, ciudad, fecha_nacimiento, sexo } = request.body;
  console.log(request.body);

  const sql = `INSERT INTO pacientes (nif, nombre, apellido, ciudad, fecha_nacimiento, sexo) VALUES ('${nif}', '${nombre}','${apellido}','${ciudad}','${fecha_nacimiento}','${sexo}')`;

  try {
    const result = await pool.query(sql);
    response.send(result);
  } catch (error) {
    console.log('Ooops! Ha habido un error...', error);
  }
  
  // body para hacer POST
  // {
  //   "nif": "75767753A",
  //   "nombre": "Juan",
  //   "apellido": "Gavira",
  //   "ciudad": "Cadiz",
  //   "fecha_nacimiento": "1983-02-13",
  //   "sexo": "H"
  // }

}

export const modifyPatient = async (request, response) => {
  const nifParam = request.params.nif;
  const { nombre, apellido, ciudad, fecha_nacimiento, sexo } = request.body;

  const sql = `UPDATE pacientes SET nombre = '${nombre}', apellido = '${apellido}', ciudad = '${ciudad}', fecha_nacimiento = '${fecha_nacimiento}', sexo = '${sexo}' WHERE nif = '${nifParam}'`;

  try {
    const [ result ] = await pool.query(sql);
    if(result.affectedRows === 0 ) return response.send("No se ha actualizado nada");
    response.send(`Actualización realizada: ${JSON.stringify(result.affectedRows)} campo actualizado.`)
  } catch (error) {
    console.log('Ooops! Ha habido un error...', error);
  }

  // body para hacer PATCH
  // {
  //   "nombre": "Pablo",
  //   "apellido": "Escobar",
  //   "ciudad": "Medellin",
  //   "fecha_nacimiento": "1963-01-01",
  //   "sexo": "H"
  // }

}

export const deletePatient = async (request, response) => {
  const nifParam = request.params.nif;

  const sql = `DELETE FROM pacientes WHERE nif = '${nifParam}'`;

  try {
    const [ result ] = await pool.query(sql);
    if(result.affectedRows === 0 ) return response.send(`No existe paciente con el nif ${nifParam}`);
    response.send(`Registro borrado.`);
  } catch (error) {
    response.status(404).send('Ooops! Ha habido un error...');
  }
}

export const genderPatients = async (request, response) => {
  const sqlMen = "SELECT COUNT(*) as hombres FROM pacientes WHERE sexo = 'H'";
  const sqlWomen = "SELECT COUNT(*) as mujeres FROM pacientes WHERE sexo = 'M'";

  try {
    const [ hombres ] = await pool.query(sqlMen);
    const [ mujeres ] = await pool.query(sqlWomen);
    const numHombres = JSON.stringify(hombres[0].hombres);
    const numMujeres = JSON.stringify(mujeres[0].mujeres);
    response.send(`Hombres: ${numHombres}
    Mujeres: ${numMujeres}`);
  } catch (error) {
    response.status(404).send('Ooops! Ha habido un error...');
  }
  
}

export const orderByLastName = async (request, response) => {

  const sql = 'SELECT * FROM pacientes ORDER BY apellido';

  try {
    const [ result ] = await pool.query(sql);
    response.send(result);
  } catch (error) {
    response.status(404).send('Ooops! Ha habido un error...');
  }

}


