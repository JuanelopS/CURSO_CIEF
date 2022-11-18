
<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<?php

// INSERT que inserta el profesor John Le Carré que dará clases de NODE.JS 

include_once './connect.php';

$nombre_profesor = 'John';
$apellido_profesor = 'Le Carré';

try {

// INSERTAR PROFESOR JOHN

  $query_insert_profesor = "INSERT INTO profesores VALUES (default, '76787677A','$nombre_profesor', '$apellido_profesor', 'Jaén', '1999-12-31', 'H', 0)";

  $insert_profesor = $pdoConnection->prepare($query_insert_profesor);
  $insert_profesor->execute();

  echo "profesor_insertado<br>";

  // BUSCAR EL ID DE JOHN E INSERTAR ASIGNATURA NODE.JS QUE IMPARTA ÉL MISMO

  $query_buscar_profesor = "SELECT pr.id_profesor FROM profesores AS pr
                           LEFT JOIN alumno_asignatura_curso AS al
                           ON pr.id_matricula = al.id_matricula
                           LEFT JOIN asignatura AS ag
                           ON  al.id_asignatura = ag.id_asignatura
                           WHERE pr.nombre = '$nombre_profesor'
                           AND pr.apellido1 = '$apellido_profesor'";

  $query_profesor = $pdoConnection->prepare($query_buscar_profesor);
  $query_profesor->execute();
  $result = $query_profesor->fetchAll();

  foreach ($result as $key => $value) {
    $profesor_id = $value['id_profesor'];
  }

  $query_insert_asignatura = "INSERT INTO asignatura VALUES (default, 'NODE.JS', 6, 'optativa', '$profesor_id', 2, 1)";

  $insert_asignatura = $pdoConnection->prepare($query_insert_asignatura);
  $insert_asignatura->execute();

  echo "asignatura_insertada";

} catch(PDOException $e) {
  print "¡Error!: " . $e->getMessage() . "<br/>";
  die();
}

$insert_profesor = null;
$insert_asignatura = null;
$pdoConnection = null;

?>
