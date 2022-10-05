//EJERCICIO 1

const boton = document.getElementById('button-bcn');
const listaDesordenada = document.querySelectorAll('.lista-población-bcn li');
const listaDesordenadaConExtras = document.querySelector('.lista-población-bcn')
const arrayPoblacion = []

Array.from(listaDesordenada).forEach(
    elemento => {
        arrayPoblacion.push(elemento.textContent);
    }
)

arrayPoblacion.sort()

boton.addEventListener(
    'click',
    () => {
        arrayPoblacion.forEach(
            (elemento, indice) => {

                let newElement = document.createElement('li');
                newElement.textContent = elemento;

                let elementoEliminado = listaDesordenadaConExtras.children[indice];

                listaDesordenadaConExtras.replaceChild(newElement, elementoEliminado);
            }
        )
    }
)

// EJERCICIO 2

const imagen = document.querySelector('#imagen img');
const parrafo = document.getElementById('answer')

imagen.addEventListener(
    'click',
    () => {
        let frase = '';
        for (i = 1; i <= 4; i++) {
            let palabras = imagen.getAttribute('prop' + i)
            frase += palabras;
        }

        parrafo.innerHTML = frase;

    }


)
