/* Me ha dado tiempo de añadir un sistema de apuestas/saldo de cada jugador */

const numJugadores = 2;
const numMonedas = 3;
var nombreUsuario = "";
var dineroUsuario = 5;
var dineroCpu = 5;

// Saldos iniciales
document.querySelector("#saldoJug").innerHTML += dineroUsuario;
document.querySelector("#saldoCpu").innerHTML += dineroCpu;

/* Primera partida, comprueba si ya existe un usuario o no para que no vuelva 
   a pedirlo (else), así como que no deje jugar sin volver a pulsar el botón 
   (oculta las imagenes hasta pulsarlo de nuevo). */

function primeraPartida() {
  actualizarSaldos(0, 0);
  if (nombreUsuario == "") {
    nombreUsuario = prompt("Por favor, escriba su nombre");
    document.getElementById("instrucciones").style.display = "none";
    document.getElementById("tablero").style.display = "block";
  } else {
    document.getElementsByClassName("imagenes")[0].style.display = "flex";
    document.getElementById("final").innerHTML = "";
    document.getElementById("ganador").innerHTML = "";
    document.getElementById("apuestas").innerHTML = "";
  }
}

/* El juego en sí: desde la función incrustada en el html, se llama 
   esta función, con el párametro correspondiente según la imagen escogida. 
   Se pregunta al usuario por las monedas totales y se almacena.
   Luego se calcula la jugada de la CPU mediante la función calculAleatori 
   (con un párametro min según el random anterior -> monedasPC), e imprimiendo 
   los mensajes de la jugada de cada usuario */

function jugar(monedasUsuario) {
  
  let jugadaUsuario;
 
  /* con un do/while no permito que el usuario haga una jugada de un nº menor a las 
     monedas que ya tiene "en la mano" */
  do{
   jugadaUsuario = prompt(
    `Has elegido ${monedasUsuario} moneda/s. Haz ahora tu jugada. (Por favor, cuenta con las monedas que ya tienes ;-)`
  );
  } while(jugadaUsuario < monedasUsuario);

  let monedasPC = calculAleatori(0, numMonedas);
  let jugadaPC = calculAleatori(monedasPC, monedasPC + numMonedas);
  // que el pc no pueda elegir el mismo nº total de monedas que el usuario
  while (jugadaUsuario == jugadaPC) {
    jugadaPC = calculAleatori(monedasPC, monedasPC + numMonedas);
  }

  // console.log(dineroCpu)
  /* Se cuecen las apuestas */
  let apJug = apuestaJugador();
  let apCpu = apuestaPC();
  let totalApostado = apJug + apCpu; // posible premio
  // actualizo los saldos 
  document.getElementById("apuestas").innerHTML = `
  <div>Apuesta del Jugador: ${apJug}</div>
  <div>Apuesta de la CPU: ${apCpu}</div>`;

  actualizarSaldos(0, 0);
  // console.log(dineroCpu)
  let mensajeFinal = `
    <p>El total ha sido ${monedasUsuario + monedasPC}</p>
    <p>${nombreUsuario} tenías ${monedasUsuario} y jugaste ${jugadaUsuario}</p>
    <p>PC tenía ${monedasPC} y jugó ${jugadaPC}</p>
    `;

  let totalMonedas = monedasUsuario + monedasPC;

  document.getElementById("final").innerHTML = mensajeFinal;

  /* Mediante if/else comprobamos si hay o no ganador y lo mostramos en su caso */

  let ganador = document.getElementById("ganador");

  if (totalMonedas == jugadaUsuario) {
    ganador.innerHTML = "<p>" + nombreUsuario + " has ganado!</p>";
    actualizarSaldos(totalApostado, 0);
  } else if (totalMonedas == jugadaPC) {
    ganador.innerHTML = "<p>Ha ganado el PC</p>";
    actualizarSaldos(0, totalApostado);
  } else {
    ganador.innerHTML = "<p>No ha habido ganador</p>";
  }

  /* Tras los premios, cambiamos el texto del botón y ocultamos las imágenes 
     evitando una nueva jugada -> al hacer nueva jugada la función primeraPartida,
     en su inicio, ya está preparada para mostrar de nuevo las imágenes y no 
     volver a pedir su nombre al jugador */
  
  
  if(dineroUsuario > 0 && dineroCpu > 0){
      document.getElementById("partida").innerHTML = "Jugar otra partida";
      document.getElementsByClassName("imagenes")[0].style.display = "none";
  }
 
  /* En caso de que alguno se quede sin saldo (o ambos), lo muestro en pantalla y 
     oculto todo salvo el pertinente mensaje a tamaño 2.5rem*/
  else {
    document.getElementById("partida").display = "none";
    document.getElementsByClassName("imagenes")[0].style.display = "none";
    document.getElementById("final").innerHTML = "";
    document.getElementById("apuestas").innerHTML = "";
    if (dineroUsuario <= 0 && dineroCpu > 0){
        document.getElementById("partida").display = "none";
        document.getElementById("ganador").innerHTML = `Te quedaste sin blanca ${nombreUsuario}`;
        document.getElementById("ganador").style.fontSize = "2.5rem";
        dineroUsuario = 5;
        dineroCpu = 5;
    }
    else if(dineroCpu <= 0 && dineroUsuario > 0){
        document.getElementById("partida").display = "none";
        document.getElementById("ganador").innerHTML = `La CPU se quedó sin saldo!`;
        document.getElementById("ganador").style.fontSize = "2.5rem";
        dineroUsuario = 5;
        dineroCpu = 5;
    }
    // EMPATE!
    else if(dineroCpu <= 0 && dineroUsuario <= 0){
      document.getElementById("partida").display = "none";
      document.getElementById("ganador").innerHTML = `Los dos al carrer!`;
      document.getElementById("ganador").style.fontSize = "2.5rem"
      dineroUsuario = 5;
      dineroCpu = 5;
      actualizarSaldos(0, 0);
      primeraPartida();
    }
  }
}
// Jugadas de la CPU
function calculAleatori(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}

/* Apuesta del jugador (mientras se lo permita su saldo y mayor que 0) */
function apuestaJugador(){
  // apuesta de usuario 
  let apuestaUsuario;
  do{
    apuestaUsuario = parseInt(prompt(`Introduce tu apuesta (Saldo: ${dineroUsuario})`));
  } while (apuestaUsuario > dineroUsuario && apuestaUsuario > 0);
  // actualizamos los saldos
  dineroUsuario -= apuestaUsuario;
  return apuestaUsuario;
}

/* Apuesta de la CPU */
function apuestaPC(){
  // apuesta de cpu
  let apuestaCpu = Math.floor(Math.random() * dineroCpu) + 1;
  // restamos los saldos
  dineroCpu -= apuestaCpu;
  return apuestaCpu;
}

/* Actualizo los saldos de los jugadores si han ganado algún premio */
function actualizarSaldos(premioJug, premioCpu){
  dineroUsuario += premioJug;
  dineroCpu += premioCpu;
  document.querySelector("#saldoJug").innerHTML = `Jugador: ${dineroUsuario}`;
  document.querySelector("#saldoCpu").innerHTML = `CPU: ${dineroCpu}`;
}