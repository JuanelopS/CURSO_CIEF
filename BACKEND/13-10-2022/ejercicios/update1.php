<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->


<!-- UPDATE que ahora el profesor John Le Carré dará clases de criptografía -->
<?php

  include_once './connect.php';

  // obtener id profesor

  $nombre_profesor = 'John';
  $apellido_profesor = 'Le Carré';

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

  // cambiar la asignatura de criptografía

  $update1 = "UPDATE asignatura SET id_profesor = '$profesor_id' WHERE nombre = 'Criptografía'";

  try {

    $update_asignatura = $pdoConnection->prepare($update1);
    $update_asignatura->execute();
    
    echo "actualizado!";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $query_profesor = null;
  $update_asignatura = null;
  $pdoConnection = null;
?>
