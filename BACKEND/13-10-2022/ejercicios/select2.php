<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<?php

  include_once './connect.php';

  $query_ejercicio2 = "SELECT * FROM alumnos 
                       JOIN alumno_asignatura_curso
                       ON alumnos.id_alumno = alumno_asignatura_curso.id_alumno
                       GROUP BY alumno_asignatura_curso.id_alumno";

  try {

    $lista_alumnos_matriculados = $pdoConnection->prepare($query_ejercicio2);
    $lista_alumnos_matriculados->execute();
    $resultado_lista_alumnos_matriculados = $lista_alumnos_matriculados->fetchAll();

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }
  
  echo "<p class='ejercicio'>2. SELECT que muestre sólo los alumnos matrículados:</p>";

  echo "<p class='p_total'>Hay un total de ". $lista_alumnos_matriculados->rowCount() . " alumnos matriculados.</p>";
  
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
  foreach ($resultado_lista_alumnos_matriculados as $key => $value) {
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

  $lista_alumnos_matriculados = null;

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