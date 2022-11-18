// Dos sintaxis para cargar express
//const express = require('express')
import express from "express";
import routerPeople from "./routes/people.routes.js";

const app = express();

app.use(express.json());

app.use(routerPeople);

app.use((req, res) => {
  res.send("No se ha encontrado ese recurso");
});

app.listen(4000);
