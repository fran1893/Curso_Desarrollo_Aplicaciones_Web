import express from 'express';
import routerPacientes from './routes/pacientes.routes.js';

const puerto = 4000
const app = express();
app.use(express.json());
app.use(routerPacientes);



app.use((req, res)=>{
    res.send("No se ha encontrado ese recurso");
});

app.listen(puerto, ()=>{console.log(`Escuchando por el puerto ${puerto}`)});