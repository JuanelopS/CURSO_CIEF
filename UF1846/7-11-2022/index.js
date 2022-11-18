const express = require('express');
const app = express();
const http = require('http').Server(app);
const io = require('socket.io')(http);

const PORT = 8080;

app.get('/', (request, response) => {
  response.render('index.ejs');
});

io.on('connection', (socket) => {
  
  socket.on('username', (username) => {
    socket.username = username;
    io.emit('is_online', `<i>${username} se ha unido al chat...</i>`)
  });

  socket.on('disconnect', (username) => {
    socket.username = username;
    io.emit('is_online', `<i>${username} se ha desconectado...</i>`)
  });

  socket.on('chat_message', (message) => {
    io.emit('is_online', `<strong>${socket.username}</strong> ${message}`);
  });

});


const server = http.listen(PORT, () => console.log(`Escuchando en el puerto ${PORT}...`));