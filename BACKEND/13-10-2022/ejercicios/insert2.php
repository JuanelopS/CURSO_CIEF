<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<?php

// INSERT que para añadir las asignaturas de NODE.JS, Servidores y Criptografia que realizará la profesora Esther Spencer
// (hay que hacerlo con joins, nada de utilizar los ids directamente)

  include_once './connect.php';

  $nombre_profesor = 'Esther';
  $apellido_profesor = 'Spencer';

  $query_buscar_profesora = "SELECT pr.id_profesor FROM profesores AS pr
                             LEFT JOIN alumno_asignatura_curso AS al
                             ON pr.id_matricula = al.id_matricula
                             LEFT JOIN asignatura AS ag
                             ON  al.id_asignatura = ag.id_asignatura
                             WHERE pr.nombre = '$nombre_profesor'
                             AND pr.apellido1 = '$apellido_profesor'";

  $query_profesora = $pdoConnection->prepare($query_buscar_profesora);
  $query_profesora->execute();
  $result = $query_profesora->fetchAll();

  foreach ($result as $key => $value) {
    $profesor_id = $value['id_profesor'];
  }

  try {

    $query_insert1 = "INSERT INTO asignatura VALUES (default, 'NODE.JS', 6, 'optativa', '$profesor_id', 2, 1)";

    $insert1 = $pdoConnection->prepare($query_insert1);
    $insert1->execute();

    echo "asignatura1 insertada";

    $query_insert2 = "INSERT INTO asignatura VALUES (default, 'Servidores', 6, 'optativa', '$profesor_id', 2, 1)";

    $insert2 = $pdoConnection->prepare($query_insert2);
    $insert2->execute();

    echo "asignatura2 insertada";

    $query_insert3 = "INSERT INTO asignatura VALUES (default, 'Criptografía', 6, 'optativa', '$profesor_id', 2, 1)";

    $insert3 = $pdoConnection->prepare($query_insert3);
    $insert3->execute();

    echo "asignatura3 insertada";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $pdoConnection = null;

?>
