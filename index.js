const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
app.get('/', (req, res) => {
  res.send('<h1>Simple Node.js Homepage</h1><p>Deployed via Jenkins CI/CD</p>');
});
app.listen(port, () => console.log(`Listening on ${port}`));
