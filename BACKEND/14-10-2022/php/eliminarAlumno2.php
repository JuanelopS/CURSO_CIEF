<?php

  include_once './connect.php';

  $id_alumno= file_get_contents("php://input");

  $delete_alumno_query = "DELETE FROM alumnos WHERE id_alumno = $id_alumno";

  // variable de listado de usuarios
  try {

    $delete_alumno = $pdoConnection->prepare($delete_alumno_query);
    $delete_alumno->execute();
    
    header("Location: ../index.php");

  } catch (Exception $err){
  print "Error!: " . $err->getMessage() . "<br>";
  die();
  }

?>