// Aquí ponemos la lógica de nuestra aplicación

import { pool } from '../db_config.js';

// Selecciona todas las personas
export const selectPeople = async (req, res) => {
    try {
        const [rows] = await pool.query("SELECT * FROM people")
        res.send(rows);
    } catch (err) {
        res.status(500).send('Ha habido un error..\nIntentelo mas tarde.');
    }

};



//  Selecciona la persona con el id dado como parametro
export const getPerson = async (req, res) => {
    try {
        const [result] = await pool.query("SELECT * FROM people WHERE id_people = ?", [req.params.id]);

        if (result.length == 0) return res.send("Persona no encontrada");

        res.json(result);

    } catch (err) {
        res.status(500).send('Ha habido un error..\nIntentelo mas tarde.');
    }
}


// Actualizar todos los datos de una persona con el id proporcionado
export const updatePerson = async (req, res) => {

    const { id } = req.params;
    const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = req.body;

    try {
        const [result] = await pool.query("UPDATE people SET nombre = ?, apellido = ?, profesion = ?, genero = ?, oscars = ?, fecha_nacimiento=? WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id]);

        if (result.affectedRows == 0) return res.send("No se ha podido actualizar");
        res.send("Actualización realizada");

    } catch (err) {
        res.status(500).send('No se ha podido actualizar registro no encontrado');
    }
}




// Insertar una persona a la base de datos
export const insertPeople = async (req, res) => {

    const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = req.body;
    try {
        const result = await pool.query("INSERT INTO people ( nombre, apellido, profesion, genero, oscars, fecha_nacimiento) VALUES (?,?,?,?,?,?)", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento]);
        res.send("Persona insertada en la base de datos")
    } catch (err) {
        return res.status(404).send('Ha habido un error..\nIntentelo mas tarde.')
    }

}


// Elminar una persona de la base de datos dando id como parametro
export const deletePeople = async (req, res) => {
    const { id } = req.params;

    try {
        const [result] = await pool.query("DELETE FROM people WHERE id_people = ?", [id]);
        if (result.affectedRows == 0) return res.send(`No se ha podido borrar el registro ${id}`);
        res.send(`Se ha eliminado el registro ${id}`);
    } catch (err) {
        return res.status(404).send('Ha habido un error..\nIntentelo mas tarde.');
    }
}



// Modificar uno o varios valores de un registro
export const patchPeople = async (req, res) => {
    const { id } = req.params;
    const { nombre, apellido, profesion, genero, oscars, fecha_nacimiento } = req.body;

    try {
        const [result] = await pool.query("UPDATE people SET nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), profesion = IFNULL(?, profesion), genero = IFNULL(?, genero), oscars = IFNULL(?, oscars), fecha_nacimiento = IFNULL(?, fecha_nacimiento) WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id]);

        if (result.affectedRows == 0) return res.send("No se ha podido actualizar");
        res.send("Actualización realizada");

    } catch (err) {
        res.status(500).send('No se ha podido actualizar registro no encontrado');
    }
}

