let tiempo;

const btnIniciar = document.querySelector("#iniciar-1");
btnIniciar.addEventListener("click",
    function () {
        return tiempo = setInterval(
            function () {
            return (document.getElementById("tiempo-1").innerHTML = new Date().toLocaleTimeString());
        },
            1000
        );
    }
);

const btnDetener = document.querySelector("#detener-1");
btnDetener.addEventListener("click",
    function () {
        clearInterval(tiempo);
        document.getElementById("tiempo-1").innerHTML = new Date().toLocaleTimeString();
    }

)