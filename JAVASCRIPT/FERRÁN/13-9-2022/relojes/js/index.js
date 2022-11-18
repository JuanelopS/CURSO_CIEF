
// RELOJ 1

const textoReloj1 = document.querySelector('#texto-reloj1');
const activarReloj1 = document.querySelector('#btn1-reloj1');
const pararReloj1 = document.querySelector('#btn2-reloj1');

const mostrarHora1 = () => {
  textoReloj1.innerHTML = `<p>${new Date().toLocaleTimeString()}</p>`;
};

const intervaloReloj1 = () => intervalo1 = setInterval(mostrarHora1, 1000);

activarReloj1.addEventListener('click', () => intervaloReloj1());
pararReloj1.addEventListener('click', () => {
  // para evitar error de llamar a clearInterval y no ha sido creado el intervalo 
  if(typeof intervalo1 != 'undefined') clearInterval(intervalo1);
});


// RELOJ 2

const textoReloj2 = document.querySelector('#texto-reloj2');
const activarReloj2 = document.querySelector('#btn1-reloj2');
const pararReloj2 = document.querySelector('#btn2-reloj2');

const mostrarHora2 = () => {
  const horaActual = new Date();
  let hora = horaActual.toLocaleTimeString().slice(0,2);
  let minuto = horaActual.toLocaleTimeString().slice(3,5);
  let segundo = horaActual.toLocaleTimeString().slice(6);
  textoReloj2.innerHTML = `<p>${hora}<small>h</small>:${minuto}<small>m</small>:${segundo}<small>s</small></p>`;
};

const intervaloReloj2 = () => intervalo2 = setInterval(mostrarHora2, 1000);

activarReloj2.addEventListener('click', () => intervaloReloj2());
pararReloj2.addEventListener('click', () => {
    if(typeof intervalo2 != 'undefined') clearInterval(intervalo2)
});

// ALARMA : MOSTRAR HORA

const textoReloj3 = document.querySelector('#texto-alarma');
const activarReloj3 = document.querySelector('#btn1-alarma');

const mostrarHora3 = () => {
  textoReloj3.innerHTML = `<p>${new Date().toLocaleTimeString()}</p>`;
};

const intervaloReloj3 = () => intervalo3 = setInterval(mostrarHora3, 1000);

activarReloj3.addEventListener('click', () => {
    intervaloReloj3();
    textoReloj3.classList = "reloj text-center";
});

// GUARDAR ALARMA

const guardarReloj3 = document.querySelector('#btn3-alarma');
const alarmasGuardadas = document.querySelector('#alarmas-guardadas');
const audioAlarma = document.querySelector('#alarma-audio');
const inputHora = document.querySelector('#inputHora');
const inputMinutos = document.querySelector('#inputMinutos');
const inputSegundos = document.querySelector('#inputSegundos');


guardarReloj3.addEventListener('click', () => {

  let alarma = `${inputHora.value}:${inputMinutos.value}:${inputSegundos.value}`;
  alarmasGuardadas.innerHTML = `<p id="alarma-fijada">${alarma}</p>`;

  // SONAR ALARMA

  const alarmaFijada =  document.querySelector('#alarma-fijada');
  const comprobarAlarma = () => intervaloAlarma = setInterval(() => {
    
    const horaDeAlarma = new Date();
    if(horaDeAlarma.toLocaleTimeString() == alarmaFijada.textContent){ 
      // MOSTRAR MODAL DE BOOTSTRAP (y sonido de alarma ^^)
      const modalText = document.querySelector('#modal-text');
      modalText.innerHTML = `Alarma de las ${alarmaFijada.textContent}`;
      audioAlarma.play();
      const modal = new bootstrap.Modal(document.querySelector('#staticBackdrop'));
      modal.show();
    }
  },1000);
  
  comprobarAlarma();

});

// BORRAR ALARMA (borrar de pantalla, clearInterval y reiniciar inputs)

const pararReloj3 = document.querySelector('#btn2-alarma');

pararReloj3.addEventListener('click', () => {
  textoReloj3.innerHTML = `<p class="parrafo-alarma"><br></p>`;
  textoReloj3.classList = "reloj text-center escondido";
  alarmasGuardadas.innerHTML = "";
  if(typeof intervalo3 != 'undefined') clearInterval(intervalo3);
  // if(typeof intervaloAlarma != 'undefined') clearInterval(invervaloAlarma);
  inputHora.value = '00';
  inputMinutos.value = '00';
  inputSegundos.value = '00';
  
});

// APAGAR SONIDO DE ALARMA AL CERRAR MODAL

const apagarAlarma = document.querySelector('#apagarAlarma');
apagarAlarma.addEventListener('click', () => audioAlarma.pause());






