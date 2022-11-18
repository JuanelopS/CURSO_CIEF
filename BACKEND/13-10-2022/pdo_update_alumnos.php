<?php

  include_once './pdo_connect.php';

  $nif = "75767753A";
  $nombre = "Juan";
  $apellido = "Gavira";
  $ciudad = "Cádiz";
  $fecha_nacimiento = "1983-02-13";
  $sexo = 'H';

  $query = "UPDATE alumnos SET ciudad = 'Cádiz' WHERE nif = '75767753A'";

  try {

    $update_alumnos = $pdoConnection->prepare($query);
    $update_alumnos->execute();

    echo "todo correcto";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  header("Location: pdo_select_alumnos.php");

  $update_alumnos = null;
  $pdoConnection = null;
?>