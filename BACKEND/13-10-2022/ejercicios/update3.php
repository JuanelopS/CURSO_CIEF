<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->


<!-- UPDATE que actualiza la ciudad del alumno con NIF 79089577Y para que sea París -->

<?php

  include_once './connect.php';

  $ciudad_alumno = 'París';


  $update3 = "UPDATE alumnos SET ciudad = '$ciudad_alumno' WHERE nif = '79089577Y'";

  try {

    $update_ciudad = $pdoConnection->prepare($update3);
    $update_ciudad->execute();
    
    echo "actualizado!";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $update_ciudad = null;
  $pdoConnection = null;
?>
