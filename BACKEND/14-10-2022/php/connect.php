<?php

  $servername = "localhost";
  $dbname = "curso_web";
  $usuario = "root";
  $password = "";

  try {
    $pdoConnection = new PDO("mysql:host=$servername;
                              dbname=$dbname",
                              $usuario,
                              $password,
                              array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));

  } catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
  }

?>