// Crea un script para que se active cuando la página se haya cargado completamente (evento load de window). Una vez cargada la página el script asignará un evento al bloque de manera que al entrar el ratón su fondo pase a rojo y al salir vuelva al blanco.

// El script se colocará en la sección head. de la página.

// <div style="display: block; width: 100px; height: 100px;" id="cuadro">
//   Cuadro que cambia al entrar el ratón
// </div>


window.onload = () => {
    let cuadro = document.getElementById("cuadro");
    // window.onmouseover = () => cuadro.style.backgroundColor = "red";
    // window.onmouseout = () => cuadro.style.backgroundColor = "white";
    cuadro.onmouseover = () => cuadro.style.backgroundColor = "red";
    cuadro.onmouseout = () => cuadro.style.backgroundColor = "white";

}