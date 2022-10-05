//Variables Iniciales
const numJugadores = 2;
const numMonedas = 3;
const maxMonedas = numJugadores * numMonedas;

var nombreUsuario = "";

//Primera partida: identifica al usuario
//Oculta los mensajes informativos de las instrucciones
//Muestra las imagenes con las opciones en monedas para el usuario
function primeraPartida() {
    nombreUsuario = prompt("Por favor, escriba su nombre");
    document.getElementById("instrucciones").style.display = "none";
    document.getElementById("tablero").style.display = "block";
    document.getElementById("elegir").innerHTML = `${nombreUsuario}, elija su opción`;
    document.getElementsByClassName("imagenes")[0].style.display = "flex";
    inicioJuego();
   
};

//El juego en si:
// Pide al usuario su jugada
function inicioJuego() {
    document.getElementById("elegir").innerHTML = `${nombreUsuario}, elija su opción`;
    document.getElementById("final").innerHTML = "";
    document.getElementById("ganador").innerHTML = "";
};

function jugar(monedasUsuario) {
    let jugadaUsuario = prompt(`Has elegido ${monedasUsuario} monedas. Haz ahora tu jugada.`);

    let monedasPC = calculAleatori(0, numMonedas);
    let jugadaPC = calculAleatori(monedasPC, monedasPC + numMonedas);

    while (jugadaUsuario == jugadaPC) {
        jugadaPC = calculAleatori(monedasPC, monedasPC + numMonedas);
    }

    document.getElementsByClassName("imagenes")[0].style.display = "none";

    let totalMonedas = monedasUsuario + monedasPC;

    let mensajeFinal = `
    <p>El total ha sido ${totalMonedas}</p>
    <p>${nombreUsuario}, tenias ${monedasUsuario} monedas y jugaste ${jugadaUsuario}</p>
    <p>PC tenía ${monedasPC} y jugó ${jugadaPC}</p>
    `;

    document.getElementById("final").innerHTML = mensajeFinal;

    if (totalMonedas == jugadaUsuario) {
        document.getElementById("ganador").innerHTML = "<p>¡" + nombreUsuario + "has ganado!</p>"
    } else if (totalMonedas == jugadaPC) {
        document.getElementById("ganador").innerHTML = "<p>¡Ha ganado el PC!</p>";
    } else {
        document.getElementById("ganador").innerHTML = "<p>¡No ha habido ganador!</p>";
    }

    document.getElementsByClassName("centrar")[0].innerHTML = `<button id="partida" class="button" onclick="inicioJuego()">Volver a jugar</button>`;


};



function calculAleatori(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
};