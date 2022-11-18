window.onload = () => {
    const botonEnvio = document.querySelector('#envioFormulario');
    const nombre = document.querySelector('#nombre');
    const opinion = document.querySelector('#opinion');

    botonEnvio.addEventListener('click', () => {
        if(!nombre.value || !opinion.value){
            alert(`Por favor rellene todos los campos.`)
        }
        else
        alert(`
        Nombre: ${nombre.value}
        Opinión: ${opinion.value}`);
    });
}