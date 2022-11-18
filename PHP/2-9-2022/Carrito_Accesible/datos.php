<?php

    print "Recogida de datos del formulario: ";
    print "<br><br>";
    print "<h2>" . ucFirst(strtolower($_POST['name'])) . "</h2>";

    // $db = mysqli_connect($servidor, $usuario, $password);
    // mysqli_select_db('carrito',$db);
    // $sql = "SELECT * FROM `formulario`";
    // $datos = mysqli_query($sql,$db);
    // mysqli_close($db);

?>