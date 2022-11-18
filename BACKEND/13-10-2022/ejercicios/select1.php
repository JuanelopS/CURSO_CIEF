<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<?php

  include_once './connect.php';

  $query_ejercicio1 = 'SELECT * FROM profesores';

  try {

    $lista_profesores = $pdoConnection->prepare($query_ejercicio1);
    $lista_profesores->execute();
    $resultado_lista_profesores = $lista_profesores->fetchAll();

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  echo "<p class='ejercicio'>1. SELECT que muestre todos los profesores:</p>";

  echo "<p class='p_total'>Hay un total de ". $lista_profesores->rowCount() . " profesores.</p>";
  echo "<table>
      <tr class='table-head'>
        <td>id</td>
        <td>Nif</td>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Ciudad</td>
        <td>Fecha nacimiento</td>
        <td>Sexo</td>
        <td>id_matricula</td>

      </tr>
    ";
  foreach ($resultado_lista_profesores as $key => $value) {
    echo "
      <tr>
        <td>" . $value['id_profesor'] . "</td>
        <td>" . $value['nif'] . "</td>
        <td>" . $value['nombre'] . "</td>
        <td>" . $value['apellido1'] . "</td>
        <td>" . $value['ciudad'] . "</td>
        <td>" . date_format( date_create($value['fecha_nacimiento']), 'd/m/Y' ). "</td>
        <td>" . $value['sexo'] . "</td>
        <td>" . $value['id_matricula'] . "</td>
      </tr>
    ";
  }
  echo "</table>";

  $lista_profesores = null;
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