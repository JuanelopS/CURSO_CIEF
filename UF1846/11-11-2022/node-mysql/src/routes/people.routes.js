import { Router } from "express";
import {
  selectPeople,
  insertPeople,
  getPerson,
  updatePerson,
  deletePeople,
  pat,
} from "../controllers/people.controller.js";

const router = Router();

// router.get("/test", getTest)

// Para mostrar
router.get("/api/people", selectPeople);

router.get("/api/people/:id", getPerson);

router.get("/api/year", (req, res) => {
  res.send("year");
});

router.get("/api/oscars", (req, res) => {
  res.send("oscars");
});

// Para añadir
router.post("/api/people", insertPeople);

// Para modificar el registro entero
router.put("/api/people/:id", updatePerson);

// Para modificar un valor de un registro
router.patch("/api/people/:id", pat);

// Para eliminar un registro
router.delete("/api/people/:id", deletePeople);

export default router;
