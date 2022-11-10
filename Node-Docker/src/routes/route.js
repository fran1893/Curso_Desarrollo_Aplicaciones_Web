// Aquí pondremos las rutas de nuestro proyecto

const{Router} = require('express');

const router = Router();

router.get('/saludo', (req, res)=>{
    res.json({saludo : "Buenas tardes"})
})


module.exports = router