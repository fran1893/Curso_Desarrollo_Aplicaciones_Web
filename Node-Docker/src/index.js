// Aquí arrancaremos el servidor

// const express = require('express');
// app.use(express.static('public'));

const app = require('./app.js');

const router = require('./routes/route.js');

app.use(router)



app.listen(4000, ()=> console.log('Server Running....'));