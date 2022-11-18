<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
</head>

<body>
</body>

</html>

<?php
echo '<h1>Soy PHP</h1>';

$hola = 'Hola Mundo!';
echo $hola;
echo '<br><br>';

print 'Versión de PHP: ' . phpversion();
print '<br><br>';

echo strrev($hola); // reverse string
echo '<br><br>';

echo ucfirst($hola); //First Upcase
echo '<br><br>';

echo strtoupper($hola); // uppercase
echo '<br><br>';

echo strlen($hola); // string length
echo '<br><br>';

echo 'Número random entre 5 y 10 ' . random_int(5, 10); //random entero entre 5 y 10
echo '<br><br>';

$arreglo = [1, 2, 3, 4, 5];

foreach($arreglo as $item){
    print $item . ' ';
}
echo '<br><br>';

$a = 5;
$b = 3;
$c = $a + $b;
echo $a . ' + ' . $b . ' = ' . sumar($a, $b);

function sumar($x, $y)
{
    return $x + $y;
}



?>