const express = require('express');
const app = express();

const PORT = 4000;

app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

app.post('/formulario', async (req, res) => {

    res.send(`<h1>Bienvenido <span style="color:blue;">${req.body.nombre}</span>!</h1>
    <h2>tu correo es: <span style="color:red;">${req.body.email}</span></h2>
    <h3>Y tu mensaje para nosotros fue: <span style="color:brown;">${req.body.texto}</span></h3>`)
})




app.listen(PORT, () => { console.log(`Escuchando por el puerto ${PORT}`) });