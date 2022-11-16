const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');


const app = express();

app.use(cookieParser())

app.use(express.static(path.join(__dirname, 'public')))

app.get('/setcookie', (req, res) =>{
    res.cookie(
        "theme",
        "dark"
    )
    res.send('SetCookies')
})


app.listen(3000, ()=> console.log('Server Running...'))