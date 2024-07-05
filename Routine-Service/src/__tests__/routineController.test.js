const request = require('supertest');
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const routineRoutes = require('../routes/routineRoutes');
require('dotenv').config();
require('../config/database'); // Ensure this is included to set up the DB connection

// Set up the Express app and routes
const app = express();
app.use(bodyParser.json());
app.use('/api/Routine', routineRoutes);

beforeAll(async () => {
  await mongoose.connect(process.env.DATABASE_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true
  });
});

afterAll(async () => {
  await mongoose.connection.close();
});

describe('Routine API', () => {
  let createdRoutineId;

  it('should create a new routine', async () => {
    const res = await request(app)
      .post('/api/Routine/add')
      .send({
        ActivityID: 1,
        PatientID: 123,
        RoutineIssues: 'Test 1',
        IncludeInSchedule: true
      });

    console.log('Create response:', res.body); // Add debug log

    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('ActivityID', 1);
    expect(res.body).toHaveProperty('PatientID', 123);
    expect(res.body).toHaveProperty('IncludeInSchedule', true);
    createdRoutineId = res.body._id; // Store the ID for later tests
  });

  // it('should get specified patient\'s routines', async () => {
  //   const res = await request(app)
  //     .get(`/api/Routine/PatientRoutine/123`);

  //   console.log('Get patient routines response:', res.body); // Add debug log

  //   expect(res.statusCode).toEqual(200);
  //   expect(res.body.length).toBeGreaterThan(0);
  // });

  // it('should delete the routine', async () => {
  //   const res = await request(app)
  //     .put(`/api/Routine/delete/${createdRoutineId}`);

  //   console.log('Delete response:', res.body); // Add debug log

  //   expect(res.statusCode).toEqual(200);
  //   expect(res.body.message).toBe('Routine marked as deleted');
  // });
});
