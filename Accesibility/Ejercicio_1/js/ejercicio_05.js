//preguntaremos al usuario  que hora es, entre 0 y las 23, si esta entre las 6 y las 14 decimos buenos dias entre 15 y 21 buenas tardes y en los demas casos buenas noches

let hora_usuario = parseInt(prompt("¿Que hora es?"));

if (hora_usuario <= 14 && hora_usuario >= 6) {
    alert("Buenos Dias!");
    console.log("Buenas Dias!");
} 
else if (hora_usuario <= 21 && hora_usuario >= 15) {
    alert("Buenas Tardes!");
    console.log("Buenas Tardes!");
}

else {console.log("Buenas Noches!"), alert("Buenas Noches!")};