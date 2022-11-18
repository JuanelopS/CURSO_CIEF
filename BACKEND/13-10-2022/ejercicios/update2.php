<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->


<!-- UPDATE que actualiza el nombre de un profesor a partir de su nombre. Prueba con Manolo Hamill, que pasará a llamarse Paco Hamill. -->
<?php

  include_once './connect.php';

  $nombre_profesor = 'Paco';

  $update2 = "UPDATE profesores SET nombre = '$nombre_profesor' WHERE nombre = 'Manolo' AND apellido1 = 'Hamill'";

  try {

    $update_profesor = $pdoConnection->prepare($update2);
    $update_profesor->execute();
    
    echo "actualizado!";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $update_profesor = null;
  $pdoConnection = null;
?>
