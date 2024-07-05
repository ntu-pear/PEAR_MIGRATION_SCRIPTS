const express = require('express');
const router = express.Router();
const routineController = require('../controllers/routineController');
const { validate } = require('../validators/routineValidator.js');

router.post('/add', validate('addRoutine'), routineController.addRoutine);
router.get('/PatientRoutine/:patientId', routineController.getPatientRoutines);
router.put('/delete/:id', routineController.deleteRoutine);

module.exports = router;