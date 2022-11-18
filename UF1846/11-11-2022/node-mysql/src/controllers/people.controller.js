// Aquí ponemos la lógica de nuestra aplicación
import { pool } from '../db_config.js'

export const selectPeople = async (req, res) => {
    try {
        const [rows] = await pool.query("SELECT * FROM people")
        res.send(rows)
    } catch (err) {
        res.status(500).send('Ha habido un error...\nInténtelo más tarde.')
    }
}

export const getPerson = async (req, res) => {
    // console.log(req.params.id);
    const [result] = await pool.query("SELECT * FROM people WHERE id_people = ?", [req.params.id])
    if (result.length == 0) return res.send("Persona no encontrada")
    res.json(result)
}

export const updatePerson = async (req, res) => {
    // console.log(req.params.id);
    //console.log(req.body)
    const { id } = req.params;
    const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = req.body;
    try {
        const [result] = await pool.query("UPDATE people SET nombre = ?, apellido = ?, profesion = ?, genero = ?, oscars = ?, fecha_nacimiento = ? WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id])
        if (result.affectedRows == 0) return res.send("No se ha podido actualizar")
        res.send("Actualización realizada")
    } catch (err) {
        res.send("No se ha podido actualizar. Registro no encontrado")
    }

}


export const insertPeople = async (req, res) => {

    const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = req.body;
    console.log(req.body);
    try {
        const result = await pool.query('INSERT INTO people (nombre, apellido, profesion, genero, oscars, fecha_nacimiento) VALUES (?,?,?,?,?,?)', [nombre, apellido, profesion, genero, oscars, fecha_nacimiento])
    } catch (err) {
        console.log(err);
        return res.status(404).send('Ha habido un error...\nInténtelo más tarde.')
    }
    res.send("req.body")
}

export const deletePeople = async(req, res) => {
    const { id } = req.params;
    try {

        const [result] = await pool.query("DELETE FROM people WHERE id_people = ?", [id])
        if (result.affectedRows == 0) return res.send(`No se ha podido borrar el registro ${id}`)
        res.send(`Se ha eliminado el registro ${id}`)
    } catch (err) {
        return res.status(404).send('Ha habido un error...\nInténtelo más tarde.')
    }

}

export const pat = async (req, res) => {
    // console.log(req.params.id);
    //console.log(req.body)
    
    const { id } = req.params;
    //console.log(  {id}   );
    const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = req.body;
    console.log(req.body);
    try {
        const [result] = await pool.query("UPDATE people SET nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), profesion = IFNULL(?, profesion), genero = IFNULL(?, genero), oscars = IFNULL(?, oscars), fecha_nacimiento = IFNULL(?, fecha_nacimiento) WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id])
        if (result.affectedRows == 0) return res.send("No se ha podido actualizar")
        res.send("Actualización realizada")
    } catch (err) {
        console.log(err);
        res.send("No se ha podido actualizar. Registro no encontrado")
    }

}


