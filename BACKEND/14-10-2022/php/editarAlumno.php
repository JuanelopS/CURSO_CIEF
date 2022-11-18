<?php

  include_once './connect.php';

  $id_alumno = $_GET['id'];

  $preparar_update_query = "SELECT * FROM alumnos WHERE id_alumno = $id_alumno";

  try {

    $preparar_update = $pdoConnection->prepare($preparar_update_query);
    $preparar_update->execute();
    $resultado_preparar_update = $preparar_update->fetch(PDO::FETCH_ASSOC);

    $nif = $resultado_preparar_update['nif'];
    $nombre = $resultado_preparar_update['nombre'];
    $apellido = $resultado_preparar_update['apellido'];
    $ciudad = $resultado_preparar_update['ciudad'];
    $fecha = date_format(date_create($resultado_preparar_update['fecha_nacimiento']), 'd/m/Y');
    $sexo = $resultado_preparar_update['sexo'];

    header("Location: ../index.php?nif=$nif&nombre=$nombre&apellido=$apellido&ciudad=$ciudad&fecha=$fecha&sexo=$sexo");

  } catch (Exception $err){
  print "Error!: " . $err->getMessage() . "<br>";
  die();
  }

?>



