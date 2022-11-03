import { Router } from "express";
import { deletePaciente, getPacientesNIF, insertPaciente, pacientesApellido, pacientesGenero, patchPaciente, selectPacientes } from "../controllers/pacientes.controller.js";
const router = Router();



// Ver todos los pacientes
router.get("/api/pacientes", selectPacientes);
// Buscar paciente por su NIF
router.get("/api/pacientes/:nif", getPacientesNIF);
// Cantidad de pacientes por genero
router.get("/api/genero", pacientesGenero);
// Muestra los pacientes ordenados por apellido
router.get("/api/apellidos",pacientesApellido);
// Añadir pacientes a la base de datos
router.post("/api/pacientes", insertPaciente);
// Modificar pacientes dando el nif como parametro
router.patch("/api/pacientes/:nif_param", patchPaciente);
// Borrar pacientes dando el nif como parametro
router.delete("/api/pacientes/:nif", deletePaciente);



export default router;