const express = require("express");
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);

const PORT = process.env.PORT || 8080;     // Socket utiliza el puerto 8080 en la variable que se encuentra en el index.ejs, si quiero que el ordenador elija el puerto aleatoriamente pondriamos 0

app.get('/chat', (req, res) => {
    res.render('index.ejs')
});

io.sockets.on("connection", (socket) => {

    socket.on("username", (username) => {
        socket.username = username;
        io.emit("is_online", `<i>${socket.username} se ha unido al chat</i>`);
    })

    socket.on("disconnect", (username) => {
        socket.username = username;
        io.emit("is_online", `<i>${socket.username} ha abandonado el chat chat</i>`)
    })

    socket.on("chat_message", (message) => {
        io.emit("is_online", `<strong> ${socket.username} </strong> ${message}`)
    })
});



const server = http.listen(PORT, () => {
    console.log(`Esuchando por el puerto ${server.address().port}`);
});
