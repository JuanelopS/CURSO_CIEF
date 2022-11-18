window.onload = () => {

  const btnEnviarTarea = document.querySelector('#mi-formulario > button');
  const tareaInput = document.querySelector('#tarea');
  const listaPendientes = document.querySelector('#listaPendientes');
  const listaAhora = document.querySelector('#listaAhora');
  const listaFinalizada = document.querySelector('#listaFinalizada');

  let listaTareasPendientes = [];
  let listaTareasAhora = [];
  let listaTareasFinalizadas = [];

  /* iconos fontawesome */

  const iconoSubir1 = '<i class="fa-solid fa-angle-up"></i>';
  const iconoSubir2 = '<i class="fa-solid fa-angles-up"></i>';
  const iconoBajar1 = '<i class="fa-solid fa-angle-down"></i>';
  const iconoBajar2 = '<i class="fa-solid fa-angles-down"></i>';
  const iconoBorrar = '<i class="fa-solid fa-delete-left"></i>';


  /* TAREAS PENDIENTES */

  const mostrarPendientes = () => {
      
    listaPendientes.innerHTML = `<h2>PENDIENTES (${listaTareasPendientes.length})</h2>`;

    /* llamo a la función renderizar con los parámetros necesarios para que sepa que "dibujar" (lugar, que lista debe dibujar, iconos, clases a asignar, etc...) */
    listaTareasPendientes.forEach( tarea => {
      renderizar(listaPendientes, 'pendiente', 'ahora', 'finalizadas', tarea, iconoBajar1, iconoBajar2);
    }); 

    const btnPendienteAhora = document.querySelectorAll('.btn-pendiente-ahora');
    const btnPendienteFinalizadas = document.querySelectorAll('.btn-pendiente-finalizadas');
    const btnPendienteBorrar = document.querySelectorAll('.btn-pendiente-borrar');

    btnPendienteAhora.forEach( item => {
      item.addEventListener('click', () => {
        // apunta al texto de la tarea
        let tareaPendiente = item.parentElement.parentElement.firstElementChild.textContent;
        
        // añado la tarea a su nueva lista
        listaTareasAhora = [...listaTareasAhora, tareaPendiente];

        // borro la tarea de donde estaba
        listaTareasPendientes = listaTareasPendientes.filter( item => item != tareaPendiente);

        actualizar();

      });
    });

    btnPendienteFinalizadas.forEach( item => {
      item.addEventListener('click', () => {
        let tareaPendiente = item.parentElement.parentElement.firstElementChild.textContent;
        listaTareasFinalizadas = [...listaTareasFinalizadas, tareaPendiente];

        listaTareasPendientes = listaTareasPendientes.filter( item => item != tareaPendiente);

        actualizar();

      });
    });

    btnPendienteBorrar.forEach( item => {
      item.addEventListener('click', () => borrar(item));
    });

  }

  /* TAREAS AHORA */
  
  const mostrarAhora = () => {

    listaAhora.innerHTML = `<h2>AHORA (${listaTareasAhora.length})</h2>`;
    
    listaTareasAhora.forEach( tarea => {
      renderizar(listaAhora, 'ahora', 'finalizadas', 'pendiente', tarea, iconoBajar1, iconoSubir1);
    }); 

    const btnAhoraFinalizada = document.querySelectorAll('.btn-ahora-finalizadas');
    const btnAhoraPendiente = document.querySelectorAll('.btn-ahora-pendiente');
    const btnAhoraBorrar = document.querySelectorAll('.btn-ahora-borrar');

    btnAhoraFinalizada.forEach( item => {
      item.addEventListener('click', () => {
        // apunta al texto de la tarea
        let tareaAhora = item.parentElement.parentElement.firstElementChild.textContent;
        
        // añadir tarea a su nueva lista
        listaTareasFinalizadas = [...listaTareasFinalizadas, tareaAhora];

        // borrar tarea de donde estaba 
        listaTareasAhora = listaTareasAhora.filter( item => item != tareaAhora);

        actualizar();

      });
    });

    btnAhoraPendiente.forEach( item => {
      item.addEventListener('click', () => {
        let tareaAhora = item.parentElement.parentElement.firstElementChild.textContent;
        listaTareasPendientes = [...listaTareasPendientes, tareaAhora];

        listaTareasAhora = listaTareasAhora.filter( item => item != tareaAhora);

        actualizar();

      });
    });

    btnAhoraBorrar.forEach( item => {
      item.addEventListener('click', () => borrar(item));
    });    

  }

  /* TAREAS FINALIZADAS */

  const mostrarFinalizada = () => {

    listaFinalizada.innerHTML = `<h2>FINALIZADAS (${listaTareasFinalizadas.length})</h2>`;
    
    listaTareasFinalizadas.forEach( tarea => {
      renderizar(listaFinalizada, 'finalizada', 'ahora', 'pendiente', tarea, iconoSubir1, iconoSubir2);
    }); 

    const btnFinalizadaAhora = document.querySelectorAll('.btn-finalizada-ahora');
    const btnFinalizadaPendiente = document.querySelectorAll('.btn-finalizada-pendiente');
    const btnFinalizadaBorrar = document.querySelectorAll('.btn-finalizada-borrar');

    btnFinalizadaAhora.forEach( item => {
      item.addEventListener('click', () => {
        let tareaFinalizada = item.parentElement.parentElement.firstElementChild.textContent;
        listaTareasAhora = [...listaTareasAhora, tareaFinalizada];

        listaTareasFinalizadas = listaTareasFinalizadas.filter( item => item != tareaFinalizada);

        actualizar();

      });
    });

    btnFinalizadaPendiente.forEach( item => {
      item.addEventListener('click', () => {
        let tareaFinalizada = item.parentElement.parentElement.firstElementChild.textContent;
        listaTareasPendientes = [...listaTareasPendientes, tareaFinalizada];

        listaTareasFinalizadas = listaTareasAhora.filter( item => item != tareaFinalizada);

        actualizar();

      });
    });

    btnFinalizadaBorrar.forEach( item => {
      item.addEventListener('click', () => borrar(item));
    });

  }

  // ENVIO DE TAREA 

  btnEnviarTarea.addEventListener('click', e => {
    e.preventDefault();

    // some() devuelve un booleano -> comprobar si ya hay una tarea repetida en los arrays
    let repetidoPendiente = listaTareasPendientes.some(tarea => tareaInput.value == tarea);
    let repetidoAhora = listaTareasAhora.some(tarea => tareaInput.value == tarea);
    let repetidoFinalizada = listaTareasFinalizadas.some(tarea => tareaInput.value == tarea);

    // añadir tarea o alerta de tarea repetida
    (repetidoPendiente || repetidoAhora || repetidoFinalizada) ? alert('Tarea repetida') : (listaTareasPendientes = [...listaTareasPendientes, tareaInput.value]);

    mostrarPendientes();
    tareaInput.value = '';
  });

  // ACTUALIZACIÓN DE LISTAS 

  const actualizar = () => {
    mostrarPendientes();
    mostrarAhora();
    mostrarFinalizada();
  }

  // BORRADO DE TAREAS 

  const borrar = item => {

        let tarea = item.parentElement.parentElement.firstElementChild.textContent;
        
        listaTareasPendientes = listaTareasPendientes.filter( item => item != tarea);
        listaTareasAhora = listaTareasAhora.filter( item => item != tarea);
        listaTareasFinalizadas = listaTareasFinalizadas.filter( item => item != tarea);

        actualizar();
  }

  /* Renderiza la lista de tareas pasándole como parámetros el lugar donde debe hacerlo, sus estilos correspondientes y los botones que deben aparecer */

  const renderizar = (posicion, origen, destino1, destino2, tarea, boton1, boton2) => {

    posicion.insertAdjacentHTML ('beforeend',`            
          <div class="tareas div-tarea-${origen}">
              <p class="texto-tarea p-tarea-${origen}">${tarea}</p>
                  <p class="opciones">
                  <span class="btn-${origen}-${destino1}">${boton1}</span>
                  <span class="btn-${origen}-${destino2}">${boton2}</span>
                  <span class="btn-${origen}-borrar">${iconoBorrar}</span>
              </p>
          </div>
    `);

  }

}
