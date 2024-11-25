// app.js
const express = require('express');
const app = express();
const port = 3000;

// Простой маршрут, который возвращает "Hello World"
app.get('/', (req, res) => {
  res.send('Hello World');
});

// Запускаем сервер
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

