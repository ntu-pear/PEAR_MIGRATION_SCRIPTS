const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();
require('./config/database'); // Ensure this is included to set up the DB connection

const app = express();
app.use(bodyParser.json());

const routineRoutes = require('./routes/routineRoutes');

app.use('/api/Routine', routineRoutes);

const PORT = process.env.ROUTINE_SERVICE_PORT || 3001;
app.listen(PORT, () => {
  console.log(`Routine Service is running on port ${PORT}`);
});
