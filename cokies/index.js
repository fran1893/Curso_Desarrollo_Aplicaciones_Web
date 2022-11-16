const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');


const app = express();

app.use(cookieParser())

app.use(express.static(path.join(__dirname, 'public')))

app.get('/setcookie', (req, res) => {
    res.cookie(
        "login",
        "true",
        {
            maxAge: 60 * 60000000000,
            sameSite: 'lax',
            // expires: new Date ('2022-11-17')
        }
    )
    res.send('SetCookies')
})

app.get('/getcookie', (req, res)=>{

    console.log(req.cookies)
})

app.listen(3000, () => console.log('Server Running...'))