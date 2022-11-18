// En la página que puedes construir con este código HTML tienes tres bloques: uno de color rojo otro de color blanco y otro de color azul. Crea un script para que cuando el ratón se mueve desde el bloque rojo al central éste se pongo rojo. Si se mueve desde el azul al central, éste se pondrá azul. Si entra en el bloque desde otro sitio el bloque recuperará el color blanco.

window.onload = () => {

let c1 = document.getElementById("c1");
let c2 = document.getElementById("c2");
let c3 = document.getElementById("c3");


c2.addEventListener('mouseenter', () => {
    c2.onmouseover = () => c2.style.backgroundColor = "white";
});

c1.addEventListener('mouseleave', () => {
    c2.onmouseover = () => c2.style.backgroundColor = "red";
});

c3.addEventListener('mouseleave', () => {
    c2.onmouseover = () => c2.style.backgroundColor = "blue";
});

}