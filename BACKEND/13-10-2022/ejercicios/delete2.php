
<!-- JUAN GAVIRA - EJERCICIOS PHP 13/10/2022 -->

<!-- DELETE que borra un alumno matriculado a partir de su nif -->

<?php

  include_once './connect.php';

  if(isset($_POST['nif'])){

    $nif_alumno = $_POST['nif'];

    $delete2 = "DELETE FROM alumnos WHERE nif = '$nif_alumno'";

    try {

      $delete_alumno = $pdoConnection->prepare($delete2);
      $delete_alumno->execute();

      // mensaje informativo según si la consulta devuelve más de una fila (rowCount)

      if($delete_alumno->rowCount() > 0){
        echo "Alumno borrado!";
      } 
      
    } catch(PDOException $e) {
      print "¡Error!: " . $e->getMessage() . "<br/>";
      die();
    }

    $delete_alumno = null;
    $pdoConnection = null;

  }

?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/styles.css">
  <title>Delete 2</title>
</head>
<body>
  <div class="container">
  <form method="POST" action="./delete2.php">
    <input type="text" name="nif" id="nif" maxlength="9">
    <input type="submit" value="BORRAR ALUMNO">
  </div>
  </form>
</body>
</html>
