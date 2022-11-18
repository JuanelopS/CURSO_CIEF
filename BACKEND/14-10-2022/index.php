<?php

  include_once './php/connect.php';

  if($_POST){

    $id = file_get_contents('php://input');
    echo "<p>$id</p>";

  }
  $query_lista_alumnos = "SELECT * FROM alumnos";

  try {

    $lista_alumnos = $pdoConnection->prepare($query_lista_alumnos);
    $lista_alumnos->execute();
    $resultado_lista_alumnos = $lista_alumnos->fetchAll(PDO::FETCH_ASSOC);
    $numero_alumnos = $lista_alumnos->rowCount();

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $pdoConnection = null;
  
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <!-- DataTables CSS -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
  <link rel="stylesheet" href="./css/style.css">
  <title>Escuela Web</title>
</head>
<body>
  <header></header>
  <main>
    <div class="container">
      <h2 class="mt-3">Curso de Desarrollo Web: <?php echo $numero_alumnos ?> alumnos</h2>
      <hr>
      <div class="row justify-content-center">
        <div class="col col-sm-3">
          <h3 class='text-center'>Formulario de inscripción</h3>
          <form>
            <div class="mb-2">
              <label class='form-label' for="nif">NIF</label>
              <input class='form-control' type="text" name="nif" id="nif" value=" <?php if($_GET) echo $_GET['nif']?> ">
            </div>
            <div class="mb-3">
              <label class='form-label' for="nif">Nombre</label>
              <input class='form-control' type="text" name="nombre" id="nombre" value=" <?php if($_GET) echo $_GET['nombre']?> "/>
            </div>
            <div class="mb-3">
              <label class='form-label' for="nif">Apellido</label>
              <input class='form-control' type="text" name="apellido" id="apellido" value=" <?php if($_GET) echo $_GET['apellido']?> "/>
            </div>
            <div class="mb-3">
              <label class='form-label' for="nif">Ciudad</label>
              <input class='form-control' type="text" name="ciudad" id="ciudad" value=" <?php if($_GET) echo $_GET['ciudad']?> "/>
            </div>
            <div class="mb-3">
              <label class='form-label' for="nif">Fecha</label>
              <input class='form-control' type="text" name="fecha_nacimiento" id="fecha_nacimiento" value=" <?php if($_GET) echo $_GET['fecha']?> "/>
            </div>
            <div class="mb-3">
              <label class='form-label' for="nif">Género</label>
              <input class='form-control' type="text" name="genero" id="genero" value=" <?php if($_GET) echo $_GET['sexo']?> "/>
            </div>
            <div class="mb-3">
              <input type='submit' class='btn btn-primary'/>
            </div>
          </form>
        </div>
        <div class="col col-sm-9">
          <h3 class='text-center mb-4'>Alumnos inscritos</h3>
          <table id="table" class="table-sm table-hover table-striped table-responsive" style="width:100%">
            <thead class="bg-dark text-light">
                <tr>
                    <th>Id</th>
                    <th>Nif</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Ciudad</th>
                    <th>Fecha Nacimiento</th>
                    <th>Género</th>
                    <th></th>
                </tr>
            </thead>
            <tbody class='align-middle'>
                <?php
                    foreach ($resultado_lista_alumnos as $key => $value) {
                      echo "
                            <tr>
                                <td>" . $value['id_alumno'] . "</td>
                                <td>" . $value['nif'] . "</td>
                                <td>" . $value['nombre'] . "</td>
                                <td>" . $value['apellido'] . "</td>
                                <td>" . $value['ciudad'] . "</td>
                                <td class='text-center'>" . date_format( date_create($value['fecha_nacimiento']), 'd/m/Y' ) . "</td>
                                <td class='text-center'>" . $value['sexo'] . "</td>
                                <td class='text-end'>
                                  <button class='btn btn-warning' onclick='editarAlumno(" .$value['id_alumno']. ")'>Editar</button>
                                  <button class='btn btn-danger' onclick='eliminarAlumno(" .$value['id_alumno']. ")'>Eliminar</button>
                                </td>
                            </tr>
                          "; 
                    }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th>Id</th>
                    <th>Nif</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Ciudad</th>
                    <th>Fecha Nacimiento</th>
                    <th>Género</th>
                    <th></th>
                </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  </main>
  <footer></footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <!-- Librerías datatable -->
  <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
  <script src="./js/app.js"></script>
  <script src="./js/eliminarAlumno2.js"></script>
  <script src="./js/editarAlumno2.js"></script>
</body>
</html>