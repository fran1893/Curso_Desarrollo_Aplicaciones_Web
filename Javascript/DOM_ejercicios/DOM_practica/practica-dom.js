//EJERCICIO 1

const listaColores = document.querySelector('.colores-1');
const green = document.createElement('li');
green.textContent = 'green';

listaColores.insertAdjacentElement('beforeend', green);


const brown = document.createElement('li');
brown.textContent = 'brown';

const coral = listaColores.children[2];
listaColores.replaceChild(brown, coral);






//EJERCICIO 2

const listaColores2 = document.querySelector('.colores-2');
const boton2 = document.getElementById('button-2');
let contador = 0;

boton2.addEventListener(
    'click',
    function () {
        let elementoLi = listaColores2.children[contador]
        if (contador == 0) {

            elementoLi.style.color = elementoLi.textContent;
            listaColores2.children[listaColores2.children.length - 1].style.color = 'black';
        }
        else if (contador == 4) {
            elementoLi.style.color = elementoLi.textContent;
            listaColores2.children[contador - 1].style.color = 'black';
            contador = -1;
        }
        else {
            elementoLi.style.color = elementoLi.textContent;
            listaColores2.children[contador - 1].style.color = 'black';
        }
        contador++
    }
)





//EJERCICIO 3

const listaColores3 = document.querySelector('.colores-3');
const boton3 = document.getElementById('button-3');


boton3.addEventListener(
    'click',
    function () {
        let contador2 = 0;
        setInterval(
            function () {
                if (contador2 == 0) {
                    let elementoLi1 = listaColores3.children[contador2]
                    elementoLi1.style.color = elementoLi1.textContent;
                    listaColores3.children[4].style.color = 'black';
                }
                if (contador2 == 1) {
                    let elementoLi2 = listaColores3.children[contador2]
                    elementoLi2.style.color = elementoLi2.textContent;
                    listaColores3.children[contador2 - 1].style.color = 'black';
                }
                if (contador2 == 2) {
                    let elementoLi3 = listaColores3.children[contador2]
                    elementoLi3.style.color = elementoLi3.textContent;
                    listaColores3.children[contador2 - 1].style.color = 'black';
                }
                if (contador2 == 3) {
                    let elementoLi4 = listaColores3.children[contador2]
                    elementoLi4.style.color = elementoLi4.textContent;
                    listaColores3.children[contador2 - 1].style.color = 'black';
                }
                if (contador2 == 4) {
                    let elementoLi5 = listaColores3.children[contador2]
                    elementoLi5.style.color = elementoLi5.textContent;
                    listaColores3.children[contador2 - 1].style.color = 'black';
                    clearInterval
                }
                contador2++
            }, 500
        )

    }
);





// EJERCICIO 4

const boton4 = document.querySelector('#mi-formulario button')
const checkbox = document.querySelector('#mi-formulario #acepto')
const nombre = document.querySelector('#mi-formulario #nombre')

checkbox.addEventListener(
    'click',
    () => {
        if (checkbox.checked) {
            boton4.removeAttribute('disabled');
        }
        else {
            boton4.setAttribute('disabled', 'disabled')
        }
    }
)

boton4.addEventListener(
    'click',
    () => {
        alert('Tu nombre es: ' + nombre.value)
    }
)








// EJERCICIO 5

const fruta = document.querySelector('a img')
const listaFrutas = document.querySelector('#frutas')

fruta.addEventListener(
    'click',
    () => {
        let kiwi = document.createElement('li')
        kiwi.textContent = fruta.getAttribute('tipo')

        listaFrutas.insertAdjacentElement('afterbegin', kiwi)
    }
)



