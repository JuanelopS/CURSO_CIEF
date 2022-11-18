// En esta página existen tres bloques ocultos. Debes crear un evento de teclado 
// para que actúe cuando el usuario pulsa una tecla. si pulsa la tecla 1 se abre el 
// bloque con id ficha1, si pulsa 2 se abre el bloque ficha2 y si 3 se abre el de ficha3.

window.onload = () => {

    let ficha1 = document.getElementById("ficha1");
    let ficha2 = document.getElementById("ficha2");
    let ficha3 = document.getElementById("ficha3");

    document.onkeydown = (e) => {
        // console.log(e.key);
        if(e.key == "1") ficha1.className = "visible";
        if(e.key == "2") ficha2.className = "visible";
        if(e.key == "3") ficha3.className = "visible";
    }
}

