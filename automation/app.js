const express = require('express');
const app = express();
const PORT = 4000;

app.get('/', (req, res) => {
  res.send('Hello from automated CI/CD!');
});

app.listen(PORT, () => {
  console.log(`Automation app running on ${PORT}`);
});

