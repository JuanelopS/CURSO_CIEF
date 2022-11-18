<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<?php

// INSERT que para matricular un alumno : datos del alumno + asignatura + curso (año inicio y final);

  include_once './connect.php';

  $alumno_nif = "11105554G";
  $asignatura = "HTML";
  $curso_anyo_inicio = 2020;
  $curso_anyo_fin = 2021;

  // Procedure guardada en la base de datos

  $query_matricular_alumno = "CALL matricular_alumno('$alumno_nif', '$asignatura', '$curso_anyo_inicio', '$curso_anyo_fin')";
  
  try {

    $matricular_alumno = $pdoConnection->prepare($query_matricular_alumno);
    $matricular_alumno->execute();
    $matricular_alumno_rows = $matricular_alumno->rowCount();

    if($matricular_alumno_rows > 0){
      echo "alumno matriculado";
    }
    else {
      echo "El alumno, la asignatura o el curso no son válidos";
    }


  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $pdoConnection = null;

?>
