<?php

    $host = "127.0.0.1";
    $username = "root";
    $password = "";
    $database = "Empleados";

    $mysqli = new mysqli($host, $username, $password, $database);
    if ($mysqli->connect_errno) {
        echo "Falló la conexión con MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    }

    // if (!$mysqli->query("DROP TABLE IF EXISTS test") ||
    //     !$mysqli->query("CREATE TABLE test(id INT)") ||
    //     !$mysqli->query("INSERT INTO test(id) VALUES (1), (2), (3)")) {
    //     echo "Falló la creación de la tabla: (" . $mysqli->errno . ") " . $mysqli->error;
    // }
    
    echo "<h1> Tabla $database </h1>";

    printf("Conjunto de caracteres inicial: %s<br>", $mysqli->character_set_name());

    // Resultados a UTF-8
    if (!mysqli_set_charset($mysqli, "utf8")) {
        printf("Error cargando el conjunto de caracteres utf8: %s<br>", mysqli_error($mysqli));
        exit();
    } else {
        printf("Conjunto de caracteres actual: %s<br>", mysqli_character_set_name($mysqli));
    }
    
    // la consulta debe ir después de pasar a utf-8
    $resultado = $mysqli->query("SELECT * FROM empleado");

    echo "<br><br>Orden inverso...<br><br>";
    for ($num_fila = $resultado->num_rows - 1; $num_fila >= 0; $num_fila--) {
        $resultado->data_seek($num_fila);
        $fila = $resultado->fetch_assoc();
        echo $fila['nombre'] . " " . $fila['apellido1'] . "<br>";
    }

    echo "<br><br>Orden del conjunto de resultados...<br><br>";
    $resultado->data_seek(0);
    while ($fila = $resultado->fetch_assoc()) {
        echo $fila['nombre'] . " " . $fila['apellido1'] . "<br>";
    }
    
?>