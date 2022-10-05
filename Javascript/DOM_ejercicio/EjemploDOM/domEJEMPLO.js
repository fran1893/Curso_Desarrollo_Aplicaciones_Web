const lista = document.querySelector(".lista");

// console.log(lista[0].children[0]); Asi seria para querySelectorAll
// console.log(lista.children[0]);  Asi seria para querySelector


// Crear un nuevo elemento en el DOM:
const newElement = document.createElement('li');

newElement.textContent = 'Cactus';
newElement.className = 'flor';

// lista.appendChild(newElement);  // Añadir el elemento


// lista.removeChild(newElement);   // Quitar l elemento


lista.insertAdjacentElement('beforebegin', newElement);   // Añadir el nuevo elemento antes del inicio del elemento seleccionado

// lista.insertAdjacentElement('beforeend', newElement); //Añade el elemento antes del final del elemento seleccionado

// lista.insertAdjacentElement('afterbegin', newElement);  //Añade el elemento despues del inicio del elemento seleccionado

// lista.insertAdjacentElement('afterend', newElement);  // Añade el elemento despues del final del elemento seleccionado


const newFlower = document.createElement('li');

// newFlower.innerHTML = '<p>Amapola</p>';
newFlower.textContent = 'Amapola'
newFlower.style.backgroundColor = "blue";
newFlower.style.color = "white";
newFlower.id = "amapola";

const oldFlower = document.querySelector('.lista').children[2];

lista.replaceChild(newFlower, oldFlower);


