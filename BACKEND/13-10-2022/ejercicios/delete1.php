
<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<!-- DELETE que borra el profesor Alejandro Kohler -->

<?php

  include_once './connect.php';

  $nombre_profesor = 'Alejandro';
  $apellido_profesor = 'Kohler';

  $delete1 = "DELETE FROM profesores WHERE nombre = '$nombre_profesor' AND apellido1 = '$apellido_profesor'";

  try {

    $delete_profesor = $pdoConnection->prepare($delete1);
    $delete_profesor->execute();
    
    echo "borrado!";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  $delete_profesor = null;
  $pdoConnection = null;

?>
