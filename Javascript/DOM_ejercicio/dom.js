const opcionsMenu = document.querySelectorAll('.opcionesMenu');
opcionsMenu.forEach((item, index) => {
    if (index % 2 == 0) {
        item.style.background = "#f2f2f2";
    }
})

const main = document.querySelector('main');
// console.log(main);

main.addEventListener(
    'click',
    (e) => {
        let objetivo = e.target;

        if (objetivo.parentNode.getAttribute('class') == 'opcionesMenu' || objetivo.getAttribute('class') == 'preguntas') {
            mostrar("r-" + objetivo.id);
        }

        if (objetivo.previousElementSibling.getAttribute('class') == ' ') {
            objetivo.textContent = "Ocultar Respuesta";
        }
        if ((objetivo.previousElementSibling.getAttribute('class') == 'div-oculto')) {
            objetivo.textContent = "Mostrar Respuesta";
        }
    }
)


// AÑADE LAS FUNCIONES QUE NECESITES

function mostrar(id) {

    let parte = document.getElementById(id);
    if (parte.getAttribute('class') == 'div-oculto') {
        parte.setAttribute('class', ' ');
    }
    else {
        parte.setAttribute('class', 'div-oculto')
    }
}