<?php 

    


?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Carrito de la compra</title>
    <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/estils.css">
    <script src="https://kit.fontawesome.com/1e7e74a174.js" crossorigin="anonymous"></script>
</head>

<body>
    <main class="container">
        <header>
            <h1 id="main_title">Carrito de la compra</h1>
            <img src="img/compra.jpg" id="main_image" alt="Frutería de supermercado" title="Sección de frutería"/>
        </header>

        <section id="presentacio">
            <h2 id="presentacio_title">Compra la <em>mejor fruta</em> en nuestro supermercado <em>online!</em></h2>
            <h3 id="presentacio_p">Escoge la fruta que quieres haciendo clic sobre su imagen</h3>
        </section>
        <hr>
        <section class="fruites">
            <ul id="lista_frutas">
                <li tabindex="0">
                    <img class="imatges" src="img/aranja.png" alt="">                
                    <h4 class="fruites_text">Pomelo: 2.50€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/kiwi.png" alt="">
                    <h4 class="fruites_text">Kiwi: 4.20€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/llimones.png" alt="">
                    <h4 class="fruites_text">Limón: 1.20€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/pinya.png" alt="">
                    <h4 class="fruites_text">Piña: 2.80€ unidad</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/sindria.png" alt="">
                    <h4 class="fruites_text">Sandía: 1.20€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/poma_vermella.png" alt="">                
                    <h4 class="fruites_text">Manzana Roja: 1.80€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/cireres.png" alt="">
                    <h4 class="fruites_text">Cerezas: 6.40€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/pressec.png" alt="">
                    <h4 class="fruites_text">Melocotón: 3.40€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/poma_verda.png" alt="">
                    <h4 class="fruites_text">Manzana Verde: 2.20€ kilo</h4>
                </li>
                <li tabindex="0">
                    <img class="imatges" src="img/melo.png" alt="">
                    <h4 class="fruites_text">Melón: 1.90€ kilo</h4>
                </li>
            </ul>
        </section>

        <hr>
        <section class="total"> 
            <h3><i class="fa-solid fa-cart-shopping fa-xl"></i>Total carrito:</h3>
            <br>
            <div id="carrito"></div>
            <div id="total_pago" tabindex="0"></div>
        </section>
        
        <!--
            Añade un formulario para pedir una valoración.
            Necesitamos dos campos: 
                1) Nombre (input)
                2) Valoración (con radiobutton)
                3) botón de envío con fondo color 
        -->
        <hr>
        <section id="formulario_valoracion">
            <form class="form_body" action="datos.php" method="POST">
                <fieldset>
                    <legend class="form-legend" tabindex="0">
                        Encuesta de satisfacción
                    </legend>
                    <div class="form_container">
                        <div class="form_group">
                            <label for="name" class="form_label">Nombre: *</label>
                            <input type="text" id="name" class="form_input" name="name" placeholder="Escriba aquí su nombre"  tabindex="0">

                            <label for="surname" class="form_label">Apellidos: *</label>
                            <input type="text" id="surname" name="surname" class="form_input" placeholder="Escriba aquí sus apellidos"   tabindex="0">

                            <label for="email" class="form_label">Email: *</label>
                            <input type="email" id="email" name="email" class="form_input" placeholder="Escriba su correo electrónico"  tabindex="0">

                            <label for="phone" class="form_label">Teléfono: </label>
                            <input type="tel" id="phone" class="form_input" name="phone" placeholder="Escriba su nº de teléfono">

                            <h4 class="form_rating_text form_label" tabindex="0">¿Cómo nos ha conocido?</h4>
                            <select name="conocido" id="conocido">
                                <option value=""></option>
                                <option value="1">Internet</option>
                                <option value="2">Anuncios TV</option>
                                <option value="3">Publicidad Papel</option>
                                <option value="4">Por un conocido</option>
                            </select>

                            <label for="nacimiento" class="form_label">Fecha de nacimiento</label>
                            <input type="date" id="nacimiento" name="nacimiento" class="form_input">

                            <h4 class="form_rating_text form_label" tabindex="0">Valoración:</h4>
                            <div class="form_rating_value" >
                                <!-- class: fa-solid: https://fontawesome.com -->
                                <label for="upvote">
                                    <input id="upvote" type="radio" name="valoracion" value="upvote" aria-label="valoracion positiva">
                                    <i class="fa-solid fa-thumbs-up fa-xl"></i>Positiva
                                </label>
                                <label for="downvote">       
                                    <input id="downvote" type="radio" name="valoracion" value="downvote" aria-label="valoracion negativa" >
                                    <i class="fa-solid fa-thumbs-down fa-xl"></i>Negativa
                                </label>
                            </div>

                        </div>                    
                        <input type="submit" class="form_submit" value="ENVIAR" aria-label="Si haces click aquí enviarás la valoración seleccionada">
                    </div>
                </fieldset>
            </form>
        </section>

    </main>
    <footer>
        <div class="footer_content">
            <p>Carrito de la compra (accesibilidad / usabilidad)</p>
            <p>Juan Gavira Pichaco</p>
        </div>
    </footer>
    <script src="js/carrito.js"></script>
</body>

</html>
