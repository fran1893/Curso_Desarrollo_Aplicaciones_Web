const listaDesordenada = document.querySelector('#marcas').children;

console.log(listaDesordenada);

const arrayMarcas = [];

Array.from(listaDesordenada).forEach(
    elemento => {
        // console.log(elemento.textContent)
        arrayMarcas.push(elemento.textContent);
    }
)

arrayMarcas.sort()

//PRIMERA MANERA DE ORDENAR LA LISTA ALFABETICAMENTE:

// Array.from(listaDesordenada).forEach(
//     function (elemento, indice) {
//             elemento.textContent = arrayMarcas[indice];         
//     }
// )


// SEGUNDA MANERA DE ORDENARLO:        PREFERIBLE

const listaDesordenada2 = document.getElementById('marcas')

// listaDesordenada2.replaceChildren();

// arrayMarcas.forEach(
//     elemento =>{
//         let newElement =document.createElement('li');
//         newElement.textContent =elemento;
//         listaDesordenada2.appendChild(newElement)
//     }
// )



//TERCERA MANERA DE ARREGLARLO:

// for(i=0; i<listaDesordenada.length; i++){
//     listaDesordenada[i].innerHTML = arrayMarcas[i]
// }




// CUARTA MANERA DE ARREGLARLO:


const newList = document.createElement('ul');

arrayMarcas.forEach(elemento =>{
    let li = document.createElement('li');
    li.textContent = elemento;
    newList.appendChild(li);
});

const divPadre = document.getElementById('div1');

divPadre.replaceChild(newList, listaDesordenada2);