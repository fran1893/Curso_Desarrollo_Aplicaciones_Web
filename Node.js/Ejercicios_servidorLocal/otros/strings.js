const fs = require ('fs');

// fs.readFile('moby10b.txt', 'utf-8', (err, libro) =>{
//     if (err) throw err
//     console.log(libro);
// })

let flujo = fs.createReadStream('moby10b.txt', 'utf-8');
let datos = '';
flujo.once('data', ()=>{
    console.log("Empezando el flujo...")
})
flujo.on('data', (chunks) =>{
    datos += chunks;
});
flujo.on('end', ()=>{
    console.log('Flujo completado')
    console.log(datos.length)
})