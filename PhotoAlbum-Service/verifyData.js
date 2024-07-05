const mongoose = require('mongoose');
require('dotenv').config();

mongoose.connect(process.env.DATABASE_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const PatientPhoto = require('./src/models/PatientPhoto');

async function verifyData() {
  try {
    const photos = await PatientPhoto.find();
    console.log('Patient Photos:', photos);
    mongoose.connection.close();
  } catch (error) {
    console.error('Error:', error);
    mongoose.connection.close();
  }
}

verifyData();