// Aquí tendremos la lógica y la configuración de express

const express = require('express');
const morgan = require('morgan');

const app = express();

app.arguments(morgan('dev'));

module.exports = app