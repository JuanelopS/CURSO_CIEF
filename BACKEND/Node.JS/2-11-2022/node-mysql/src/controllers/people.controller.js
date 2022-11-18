// Aquí ponemos la lógica de nuestra aplicación
import { pool } from '../db_config.js';



export const selectPeople = async (request, response) => {

  const sql = "SELECT * FROM people";

  try {
    const [ rows ] = await pool.query(sql);
    response.send(rows);
  } catch (error) {
    response.status(500).send('Ooops! Ha habido un error...');
  }
}

// ! ESTO NO FUNCIONA (request.body)
export const insertPeople = async (request, response) => {

  const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = request.body;
    console.log(request.body);
    try {
        const result = await pool.query('INSERT INTO people (nombre, apellido, profesion, genero, oscars, fecha_nacimiento) VALUES (?,?,?,?,?,?)', [nombre, apellido, profesion, genero, oscars, fecha_nacimiento])
    } catch (err) {
        console.log(err);
        return response.status(404).send('Ha habido un error...\nInténtelo más tarde.')
    }
    res.send("req.body")
  
  // {
  //   "nombre": "Paul", 
  //   "apellido": "Newman", 
  //   "profesion": 2, 
  //   "genero": 2, 
  //   "oscars": 2, 
  //   "fecha_nacimiento": 1925
  // }
}

export const getPerson = async (request, response) => {
  // console.log(request.params.id);
  const [ result ] = await pool.query("SELECT * FROM people WHERE id_people = ?", [request.params.id]);
  if(result.length == 0) return response.send('Persona no encontrada');
  response.json(result);
}


export const updatePerson = async (request, response) => {
  // console.log(request.params.id);
  // console.log(request.body);

  const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = request.body;
  const { id } = request.params;

  try {
    const [ result ] = await pool.query("UPDATE people SET nombre = ?, apellido = ?, profesion = ?, genero = ?, oscars = ?, fecha_nacimiento = ? WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id]);
    if(result.affectedRows === 0 ) return response.send("No se ha actualizado nada");
    response.send(`Actualización realizada: ${JSON.stringify(result.affectedRows)} campo actualizado.`)
  } catch (error) {
    response.send(`Error al actualizar: ${error}`)
  }

}


export const deletePeople = async (request, response) => {
  
  const {id} = request.params;

  try {
    const [ deletePeople ] = await pool.query("DELETE FROM people WHERE id_people = ?", [id]);

    if(result.affectedRows === 0 ) return response.send(`No se ha podido borrar el registro ${id}`);
    response.send(`Registro borrado.`);
  } catch (error) {
    response.status(404).send('Ooops! Ha habido un error...');
  }
}

export const patchPeople = async (request, response) => {
  // console.log(request.params.id);
  // console.log(request.body);
  const { id } = request.params;
  const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = request.body;
  
  try {
    const [ result ] = await pool.query("UPDATE people SET nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), profesion = IFNULL(?, profesion), genero = IFNULL(?, genero), oscars = IFNULL(?, oscars), fecha_nacimiento = IFNULL(?, fecha_nacimiento) WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id]);
    if(result.affectedRows === 0 ) return response.send("No se ha actualizado nada");
    response.send(`Actualización realizada: ${JSON.stringify(result.affectedRows)} campo actualizado.`)
  } catch (error) {
    response.send(`Error al actualizar: ${error}`)
  }

}