const express = require('express');
const app = express();

const PORT = 4000;

app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

app.post('/formulario', async (req, res) => {
    res.json(req.body)
})




app.listen(PORT, () => { console.log(`Escuchando por el puerto ${PORT}`) });