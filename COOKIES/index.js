const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');

const app = express();
app.use(cookieParser());

app.use(express.static(path.join(__dirname, 'public')));


app.get('/setcookie', (request, response) => {
  response.cookie(
    "theme",
    "dark",
    {
      maxAge: 60 * 1000000,
      sameSite: 'lax',
      // expires: new Date('2022-11-17')
    }
  );
  response.send('setCookie');

});

app.get('/getcookie', (request, response) => {
  const cookies = request.cookies;
  response.send(cookies.theme);
})

app.listen(3000, () => console.log('Listening at port 3000...'));