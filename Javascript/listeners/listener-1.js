window.addEventListener("load", iniciarPrograma);

function iniciarPrograma() {
    // alert("Hola");

    const boton = document.querySelector(".btn-danger")
    boton.addEventListener(
        "click",
        (e) => {
            console.log(e.target.id);
            alert(`has hecho ${e.type} en un ${e.target.id}`);
        }
    )
}