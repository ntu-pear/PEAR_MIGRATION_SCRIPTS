const express = require('express');
const router = express.Router();
const patientPhotoController = require('../controllers/patientPhotoController');
const parser = require('../config/multer');
const { validate } = require('../validators/patientPhotoValidator');

router.get('/:patientId', patientPhotoController.getPatientPhotos);
router.get('/GetAlbumByCategory/:patientId/:categoryId', patientPhotoController.getPatientPhotosByCategory);

router.post('/add', parser.single('PhotoPath'), validate('addPatientPhoto'), patientPhotoController.addPatientPhoto);
router.put('/update/:id', parser.single('PhotoPath'), validate('updatePatientPhoto'), patientPhotoController.updatePatientPhoto);
router.put('/delete/:id', patientPhotoController.deletePatientPhoto);

module.exports = router;
