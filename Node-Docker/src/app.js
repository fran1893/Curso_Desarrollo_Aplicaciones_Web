// Aquí tendremos la lógica y la configuración de express

const express = require('express');
const morgan = require('morgan');

const app = express();

app.use(morgan('dev'));

app.use(require('./routes/route.js'));

module.exports = app