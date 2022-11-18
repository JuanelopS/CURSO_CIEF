const { dir } = require("console");
const express = require("express");
const { argv } = require("process");
const app = express();


/* Puerto según el parámetro introducido */
const { PORT = argv[2] } = process.env;

/* Importación de los datos */
const estudiantes = require("./datos/estudiantes.json");

// Directorio del fichero index.html
const dirHTML = 'public';
// Obtiene el directorio de los ficheros estáticos
app.use(express.static(dirHTML));

app.get("/", (req, res) => {
  res.sendFile(dirHTML, { root: __dirname });
});


app.get('/api/estudiantes', (req, res) => {
  
  // TODO: REVISAR ESTA CONDICIÓN -> devuelve {} pero no deja compararlo
  if(req.query.mayor || req.query.aprobado){
    
    /* 3.	localhost:3000/api/estudiantes?mayor=5
    Filtrar los estudiantes cuya nota es mayor que un valor establecido. En el ejemplo es 5, pero puede ser cualquier valor que se introduzca. 
    Console.log(XXX alumnos tienen una nota mayor que ${nota}) */

    if(req.query.mayor)
    {
      /* existe la query "mayor", filter con respecto a las notas de los alumnos, y el length para saber la cantidad de elementos que cumplían la condición */
      const queryNota = parseFloat(req.query.mayor);
      const resultado = estudiantes.filter(({nota}) => nota > queryNota);
      res.json(resultado);
      console.log(`${resultado.length} alumnos tienen una nota mayor que ${queryNota}`);
    }

    /* 4.	Mostrar los estudiantes que ha suspendido ordenados por edad de mayor a menor. La nota de corte se establece por parámetro. (parámetro aprobado) */

    if(req.query.aprobado){

      /* Existe el query "aprobado", filtrar los alumnos con nota menor a dicha query, y luego sort para ordenarlos por edad */
      const queryNota = parseFloat(req.query.aprobado);
      const suspendidos = estudiantes.filter(({nota}) => nota < queryNota);
      const suspendidosOrdenados = suspendidos.sort((a,b) => b.edad - a.edad);
      res.json(suspendidosOrdenados);
    }

  } else {

    /* 1.	localhost:3000/api/estudiantes
    Mostrará todos los estudiantes ordenados alfabéticamente por apellido de la A a la Z. */

    const resultado = estudiantes.sort((a,b) => a.apellidos.localeCompare(b.apellidos));
    res.json(resultado);
  }

});

/* 2.	localhost:3000/IreneyNicolas@gmail.com
Crear un filtro por email. Mostrará el estudiante que cumpla la condición. */

app.get("/:email", (req, res) => {
  
  /* simple filter si existe o no el email (esta vez es un req.param, no una query), si devuelve 0 (length), no hay alumno con dicho email */
  const emailParam = req.params.email;
  const resultado = estudiantes.filter(({ email }) => email === emailParam);
  if(resultado.length){
    return res.json(resultado);
  } else{
    return res.send('No existe ningún estudiante con ese email.');
  }
  
});


/* 5.	Mostrar todos los estudiantes ordenados por nota. En caso de empate, también por edad. En ambos casos de mayor a menor. */

app.get("/api/ranking", (req, res) => {
  
  /* sort que ordene por edad si las notas son iguales */
  const ordenados = estudiantes.sort((a, b) => {
    if(b.nota === a.nota){
      return b.edad - a.edad;
    }  
    else{
      return b.nota - a.nota;
    } 
  });

  res.json(ordenados);
  
});

app.get('*', (req, res) => {
  res.status(404).sendFile('./' + dirHTML + `/404.html`, { root: __dirname });
});

app.listen(PORT, () => console.log(`Listen at http://localhost:${PORT}...`));


