const express = require('express');
const app = express();

const PORT = 4000;

app.use(express.static('public'));

app.post('/formulario',(req, res)=>{

})




app.listen(PORT, ()=>{console.log(`Escuchando por el puerto ${PORT}`)});