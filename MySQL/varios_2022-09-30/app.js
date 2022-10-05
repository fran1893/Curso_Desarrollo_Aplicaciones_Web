import { autores, editoriales } from './datos.js';

import { dividir } from './funciones.js';


// console.log(dividir(1, 2))
// console.log(dividir(1, 0))
// console.log(dividir(1, 'a'))

// console.log(autores.autor1.nombre.pseudonimo)


// try {
//     console.log(1 / 'a')
//     throw 'Mi error'
// } catch (error) {
//     console.log(error)
// }




// miAutor(autores, callback1, callback2)

// function miAutor(autores, callback1, callback2) {
//     callback1(autores, callback2)
//     console.log(callback1(autores))
// }


// function callback1(autores, callback2) {
//     return callback2(autores.autor1)
// }


// function callback2(autor) {
//     return autor.nombre
// }



const misDatos = (misAutores) => {
    return new Promise((resolve, reject) => {
        let opcion = true
        if (opcion) {
            setTimeout(() => {
                return resolve(misAutores)
            }, 3000)

        } else {
            return reject('No he encontrado los autores')
        }
    })
}

misDatos(autores)
    .then(() => { console.log(autores.autor2.nombre.pseudonimo) })
    .catch(error => console.log(error))


    console.log('Estoy haciendo otras cosas')