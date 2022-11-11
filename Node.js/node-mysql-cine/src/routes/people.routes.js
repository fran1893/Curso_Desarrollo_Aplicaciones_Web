import { Router } from "express";
import {selectPeople} from '../controllers/people.controller.js';
import { insertPeople } from "../controllers/people.controller.js";
import { getPerson } from "../controllers/people.controller.js";
import { updatePerson } from "../controllers/people.controller.js";
import { deletePeople } from "../controllers/people.controller.js";
import { patchPeople } from "../controllers/people.controller.js";
const router = Router();




// Para mostrar todas las personas
router.get("/api/people", selectPeople);
// Para mostrar la persona con el id que le digamos
router.get("/api/people/:id", getPerson);


router.get("/api/year", (req, res) => {
    res.send("year");
});

router.get("/api/oscars", (req, res) => {
    res.send("oscars");
});


// Para añadir una persona
router.post("/api/people", insertPeople);


// Para modificar el registro entero
router.put("/api/people/:id", updatePerson);



// Para modificar un valor de un registro
router.patch("/api/people/:id", patchPeople);



// Para eliminar un registro
router.delete("/api/people/:id", deletePeople);


export default router;