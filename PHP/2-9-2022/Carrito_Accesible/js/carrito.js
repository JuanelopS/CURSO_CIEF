window.onload = () => {

    /* CARRITO DE FRUTAS */
    
    // #lista_frutas -> ul -> children -> li
    const listaImagenes = document.querySelector('#lista_frutas').children;
    // console.log(listaImagenes);

    let total = 0;

    // evento click para cada imagen
    for(let item of listaImagenes){
        item.addEventListener('click', () => {
            // console.log(item.lastElementChild.innerHTML);
            addFruta(item.lastElementChild.innerHTML);
            extractorPrecio(item.lastElementChild.innerHTML);
            actualizarTotal();
        });
    }

    // función añadir fruta al html
    const addFruta = fruta => {
        const carrito = document.getElementById('carrito');
        carrito.insertAdjacentHTML('beforeend', `<p class="compra"> - ${fruta}</p>`);
    };

    // función extraer el precio del html y sumar el total
    const extractorPrecio = fruta => {
        const regex = /\d+/g;
        const precio = parseFloat(fruta.match(regex).reduce((a, b) => `${a}.${b}`));
        total += precio;
    };

    // mostrar/actualizar total en pantalla
    const actualizarTotal = () => {
        const totalPago = document.getElementById('total_pago');
        totalPago.innerHTML = `Total a pagar: ${total.toFixed(2)}€`;
    };


    /* FORMULARIO VALORACION */

    /* const botonFormulario = document.querySelector('input[type="submit"]');

    botonFormulario.addEventListener('click', () => {
    // console.log('el formulario se envía....');

        const nombre = document.getElementById('name');
        const apellidos = document.getElementById('surname');
        const email = document.getElementById('email');
        const telefono = document.getElementById('phone');
        const conocido = document.getElementById('conocido');
        const nacimiento = document.getElementById('nacimiento');
        const valoracion = document.querySelector('[name="valoracion"]:checked');

        console.log(nombre.value, apellidos.value, valoracion.value);

    });*/

}
