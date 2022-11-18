<?php

  include_once './pdo_connect.php';

  $query = 'SELECT * FROM alumnos';

  try {

    $lista_alumnos = $pdoConnection->prepare($query);
    $lista_alumnos->execute();
    $result = $lista_alumnos->fetchAll();

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }
  
  echo "<p class='p_total'>Hay un total de ". $lista_alumnos->rowCount() . " alumnos.</p>";
  echo "<table>
      <tr class='table-head'>
        <td>id</td>
        <td>Nif</td>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Ciudad</td>
        <td>Fecha nacimiento</td>
        <td>Sexo</td>
      </tr>
    ";
  foreach ($result as $key => $value) {
    echo "
      <tr>
        <td>" . $value['id_alumno'] . "</td>
        <td>" . $value['nif'] . "</td>
        <td>" . $value['nombre'] . "</td>
        <td>" . $value['apellido'] . "</td>
        <td>" . $value['ciudad'] . "</td>
        <td>" . date_format( date_create($value['fecha_nacimiento']), 'd/m/Y' ). "</td>
        <td>" . $value['sexo'] . "</td>
      </tr>
    ";
  }
  echo "</table>";

  $lista_alumnos = null;
  $pdoConnection = null;

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PHP - MYSQL</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  
</body>
</html>