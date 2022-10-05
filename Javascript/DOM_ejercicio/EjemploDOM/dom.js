//METODOS ANTIGUOS

getElementsByClassName('nombre_de_la_clase')

const normal = document.getElementsByClassName('normal');
console.log(normal);

const normal4 = document.getElementsByTagName('nombre_de_la_etiqueta');


//USAR MEJOR:

const normal3 = document.querySelectorAll('.lista li');
console.log(normal3);
const normal2 = document.querySelectorAll('.normal, .especial');
console.log(normal2);

//Para seleccionar ids : getElementByid('nombre_del_id');

//Usar querySelector(), cuando solo se necesite el primer elemento.

const lista = document.querySelectorAll('.lista');
console.log(lista)

lista.forEach(elemento =>{
    elemento.style.backgroundColor = 'green';   // CAMBIA EL COLOR DE FONDO
})


const lista2 = document.querySelector('.lista');
// numero de elementos:
console.log(lista2.childElementCount);
// Elementos hijos:
console.log(lista2.children);
// Primeros hijos:
console.log(lista2.firstElementChild);

//inyecta codigo HTML:
lista2.firstElementChild.innerHTML="Violeta";

//Cambia el contenido de texto pero no inyecta codigo HTML:
lista2.lastElementChild.textContent="Marron";

const primer_li = lista2.firstElementChild;
//ir al siguiente elemento hermano:
console.log(primer_li.nextElementSibling);


const ulti_li = lista2.lastElementChild;
//devuelve el anterior elemento hermano:
console.log(ulti_li.previousElementSibling);