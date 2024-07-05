// src/index.js
const express = require('express');
const bodyParser = require('body-parser');
const patientPhotoRoutes = require('./routes/patientPhotoRoutes');
const sequelize = require('./config/database');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());

app.use('/api/PatientPhoto', patientPhotoRoutes);

sequelize.sync()
  .then(() => {
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  })
  .catch(err => console.log('Error syncing with database', err));
