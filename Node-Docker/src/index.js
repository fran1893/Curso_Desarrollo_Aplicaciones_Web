// Aquí arrancaremos el servidor

// const express = require('express');
// app.use(express.static('public'));

const app = require('./app.js');


app.listen(4000, ()=> console.log('Server Running....'));