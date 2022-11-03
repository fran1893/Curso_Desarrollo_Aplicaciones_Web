import { pool } from '../db_config.js';


// Selecciona todos los pacientes
export const selectPacientes = async (req, res) => {
    try {
        const [rows] = await pool.query("SELECT * FROM pacientes");
        res.send(rows);
    } catch (err) {
        res.status(500).send('Ha habido un error..\nIntentelo mas tarde.');
    }

};
// Buscar los pacientes por el NIF
export const getPacientesNIF = async (req, res)=>{
    try {
        const [result] = await pool.query("SELECT * FROM pacientes WHERE nif = ?", [req.params.nif]);

        if (result.length == 0) return res.send("No se ha encontrado ningún paciente con ese NIF/NIE");

        res.json(result);
    } catch (err) {
        res.status(500).send("Ha habido un error..\nIntentelo mas tarde.")
    }
};
// Agregar un paciente a la base de datos
export const insertPaciente = async (req, res) => {

    const { nif, nombre, apellido, ciudad, fecha_nacimiento, sexo } = req.body;
    try {
        const result = await pool.query("INSERT INTO pacientes (nif, nombre, apellido, ciudad, fecha_nacimiento, sexo) VALUES (?,?,?,?,?,?)", [nif, nombre, apellido, ciudad, fecha_nacimiento, sexo]);
        res.send("Paciente Agregado en la base de datos")
    } catch (err) {
        return res.status(404).send('Ha habido un error..\nIntentelo mas tarde.')
    }

};
// Modificar uno o varios valores de un paciente dando su id como parametro
export const patchPaciente = async (req, res) => {
    const { nif_param } = req.params;
    const {nif ,nombre, apellido, ciudad, fecha_nacimiento, sexo } = req.body;

    try {
        const [result] = await pool.query("UPDATE pacientes SET nif = IFNULL(?, nif), nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), ciudad = IFNULL(?, ciudad), fecha_nacimiento = IFNULL(?, fecha_nacimiento), sexo = IFNULL(?, sexo) WHERE nif = ?", [nif, nombre, apellido, ciudad, fecha_nacimiento, sexo, nif_param]);

        if (result.affectedRows == 0) return res.send("No se ha podido actualizar");
        res.send("Actualización realizada");

    } catch (err) {
        res.status(500).send('No se ha podido actualizar registro no encontrado');
    }
};
// Borrar pacientes dando el nif como parametro
export const deletePaciente = async (req, res) =>{
    const { nif } = req.params;

    try {
        const [result] = await pool.query("DELETE FROM pacientes WHERE nif = ?", [nif]);

        if (result.affectedRows == 0) return res.send(`No se ha podido borrar el registro del paciente con NIF/NIE: ${nif}`);
        res.send(`Se ha eliminado el registro del paciente con NIF/NIE: ${nif}`);
    } catch (err) {
        return res.status(404).send('Ha habido un error..\nIntentelo mas tarde.');
    }
};
// Mostrar la cantidad de pacientes de cada género
export const pacientesGenero = async (req, res) =>{
    try {
        const [cantidadMujeres] = await pool.query(`SELECT COUNT(*) FROM pacientes WHERE sexo = "M"`);
        const [cantidadHombres] = await pool.query(`SELECT COUNT(*) FROM pacientes WHERE sexo = "H"`);
        
        res.send(`La cantidad de pacientes mujeres es de: ${cantidadMujeres[0]['COUNT(*)']} <br>La cantidad de pacientes hombres es de: ${cantidadHombres[0]['COUNT(*)']}`);
    } catch (err) {
        res.status(500).send('Ha habido un error..\nIntentelo mas tarde.');
    }
};
// Mostrar los pacientes ordenados por apellido
export const pacientesApellido = async(req, res) =>{
    try {
        const [resultado] = await pool.query('SELECT * FROM pacientes ORDER BY apellido')
        res.json(resultado)
    } catch (err) {
        res.status(500).send('Ha habido un error..\nIntentelo mas tarde.');
    }
};