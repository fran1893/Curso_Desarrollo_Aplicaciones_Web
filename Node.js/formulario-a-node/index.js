const express = require('express');
const app = express();

const PORT = 4000;

app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

app.post('/formulario', async (req, res) => {
    res.send(`<h1>Bienvenido ${req.body.nombre}!</h1>
    <h2>tu correo es ${req.body.email}</h2>
    <h3>Y tu mensaje para nosotros fue: ${req.body.texto}</h3>`)
})




app.listen(PORT, () => { console.log(`Escuchando por el puerto ${PORT}`) });