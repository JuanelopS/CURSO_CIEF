<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<?php

  include_once './connect.php';

  $query_ejercicio3 = "SELECT * FROM alumnos 
                       JOIN alumno_asignatura_curso
                       ON alumnos.id_alumno = alumno_asignatura_curso.id_alumno
                       JOIN curso_escolar
                       ON alumno_asignatura_curso.id_curso = curso_escolar.id_curso
                       GROUP BY alumno_asignatura_curso.id_alumno
                       ORDER BY curso_escolar.anyo_inicio DESC";

  try {

    $lista_alumnos_matriculados_ordenados = $pdoConnection->prepare($query_ejercicio3);
    $lista_alumnos_matriculados_ordenados->execute();
    $resultado_lista_alumnos_matriculados_ordenados = $lista_alumnos_matriculados_ordenados->fetchAll();

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }
  
  echo "<p class='ejercicio'>3. SELECT que muestre los alumnos matriculados ordenados por año de inicio descendente (de mayor a menor):</p>";

  echo "<p class='p_total'>Hay un total de ". $lista_alumnos_matriculados_ordenados->rowCount() . " alumnos ordenados por curso.</p>";
  
  echo "<table>
      <tr class='table-head'>
        <td>id</td>
        <td>Nif</td>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Año inicio</td>
      </tr>
    ";
  foreach ($resultado_lista_alumnos_matriculados_ordenados as $key => $value) {
    echo "
      <tr>
        <td>" . $value['id_alumno'] . "</td>
        <td>" . $value['nif'] . "</td>
        <td>" . $value['nombre'] . "</td>
        <td>" . $value['apellido'] . "</td>
        <td>" . $value['anyo_inicio'] . "</td>

      </tr>
    ";
  }
  echo "</table>";


  $lista_alumnos_matriculados_ordenados = null;
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