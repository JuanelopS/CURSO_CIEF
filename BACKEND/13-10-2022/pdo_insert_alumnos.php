<?php

  include_once './pdo_connect.php';

  $nif = "75767753A";
  $nombre = "Juan";
  $apellido = "Gavira";
  $ciudad = "Cádiz";
  $fecha_nacimiento = "1983-02-13";
  $sexo = 'H';

  $query = "INSERT INTO alumnos VALUES(default, ?, ?, ?, ?, ?, ?)";

  try {

    $insert_alumnos = $pdoConnection->prepare($query);
    $insert_alumnos->execute(array($nif, $nombre, $apellido, $ciudad, $fecha_nacimiento, $sexo));

    echo "todo correcto";

  } catch(PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

  header("Location: pdo_select_alumnos.php");

  $insert_alumnos = null;
  $pdoConnection = null;
?>