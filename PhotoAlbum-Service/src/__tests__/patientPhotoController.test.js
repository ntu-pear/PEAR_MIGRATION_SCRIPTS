const request = require('supertest');
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const patientPhotoRoutes = require('../routes/patientPhotoRoutes');
require('dotenv').config();
require('../config/database'); // Ensure this is included to set up the DB connection

// Set up the Express app and routes
const app = express();
app.use(bodyParser.json());
app.use('/api/PatientPhoto', patientPhotoRoutes);

beforeAll(async () => {
  await mongoose.connect(process.env.DATABASE_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true
  });
});

afterAll(async () => {
  await mongoose.connection.close();
});

describe('Patient Photo API', () => {
  let createdPhotoId;

it('should create a new patient photo', async () => {
    const res = await request(app)
      .post('/api/PatientPhoto/add')
      .attach('PhotoPath', 'test/test-image.jpg') // Provide the correct path to the test image
      .field('PhotoDetails', 'A beautiful day at the park')
      .field('AlbumCategoryListID', 1)
      .field('PatientID', 123);

    console.log('Create response:', res.body); // Add debug log

    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('PhotoPath');
    expect(res.body.PhotoDetails).toBe('A beautiful day at the park');
    createdPhotoId = res.body._id; // Store the ID for later tests
  });

  // it('should get specified patient\'s photo records and holiday experience', async () => {
  //   const res = await request(app)
  //     .get(`/api/PatientPhoto/${123}`);

  //   console.log('Get patient photos response:', res.body); // Add debug log

  //   expect(res.statusCode).toEqual(200);
  //   expect(res.body.length).toBeGreaterThan(0);
  // });

  // it('should update the patient photo', async () => {
  //   const res = await request(app)
  //     .put(`/api/PatientPhoto/update/668251a158a71a7773699965`)
  //     .field('PhotoPath', 'https://res.cloudinary.com/your-cloud-name/image/upload/v1234567890/updated-sample.jpg') // Provide direct PhotoPath
  //     .field('PhotoDetails', 'An updated beautiful day at the park')
  //     .field('AlbumCategoryListID', 2)
  //     .field('PatientID', 456)
  //     .field('HolidayExperience', JSON.stringify({
  //       CountryListID: 2,
  //       StartDate: new Date().toISOString(),
  //       EndDate: new Date().toISOString()
  //     }));

  //   console.log('Update response:', res.body); // Add debug log

  //   expect(res.statusCode).toEqual(200);
  //   expect(res.body.message).toBe('Patient photo updated successfully');
  // });

  // it('should get specified patient\'s photo album by category', async () => {
  //   const res = await request(app)
  //     .get(`/api/PatientPhoto/GetAlbumByCategory/456/2`);

  //   console.log('Get patient photos by category response:', res.body); // Add debug log

  //   expect(res.statusCode).toEqual(200);
  //   expect(res.body.length).toBeGreaterThan(0);
  // });

  // it('should delete the patient photo', async () => {
  //   const res = await request(app)
  //     .put(`/api/PatientPhoto/delete/6684f3fa517062a6010d6104`);

  //   console.log('Delete response:', res.body); // Add debug log

  //   expect(res.statusCode).toEqual(200);
  //   expect(res.body.message).toBe('Patient photo marked as deleted');
  // });
});
