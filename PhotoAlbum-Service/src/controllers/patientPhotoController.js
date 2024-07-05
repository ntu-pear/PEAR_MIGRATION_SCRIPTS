const { validationResult } = require('express-validator');
const PatientPhoto = require('../models/PatientPhoto');
const cloudinary = require('cloudinary').v2;

// Configure Cloudinary
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

exports.addPatientPhoto = async (req, res) => {
  console.log('Received request to add patient photo');
  console.log('Request body:', req.body);
  console.log('File info:', req.file);

  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    console.log('Validation errors:', errors.array());
    return res.status(400).json({ errors: errors.array() });
  }

  try {
    const { PhotoDetails, AlbumCategoryListID, PatientID, HolidayExperience } = req.body;

    // Upload image to Cloudinary
    const result = await cloudinary.uploader.upload(req.file.path, {
      folder: 'patient_photos'
    });

    const PhotoPath = result.secure_url;

    const newPhoto = new PatientPhoto({
      PhotoPath,
      PhotoDetails,
      AlbumCategoryListID,
      PatientID,
      HolidayExperience: HolidayExperience ? JSON.parse(HolidayExperience) : undefined
    });

    await newPhoto.save();
    res.status(201).json(newPhoto);
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};

exports.updatePatientPhoto = async (req, res) => {
  console.log('Received request to update patient photo');
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    console.log('Validation errors:', errors.array());
    return res.status(400).json({ errors: errors.array() });
  }

  try {
    const { id } = req.params;
    const { PhotoDetails, AlbumCategoryListID, PatientID, HolidayExperience } = req.body;
    let updatedFields = { PhotoDetails, AlbumCategoryListID, PatientID };

    if (req.file) {
      // Upload new image to Cloudinary
      const result = await cloudinary.uploader.upload(req.file.path, {
        folder: 'patient_photos'
      });
      updatedFields.PhotoPath = result.secure_url;
    }

    if (HolidayExperience) {
      updatedFields.HolidayExperience = JSON.parse(HolidayExperience);
    }

    const updatedPhoto = await PatientPhoto.findByIdAndUpdate(id, updatedFields, { new: true });

    if (updatedPhoto) {
      res.status(200).json({ message: 'Patient photo updated successfully', updatedPhoto });
    } else {
      res.status(404).json({ message: 'Patient photo not found' });
    }
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};

exports.deletePatientPhoto = async (req, res) => {
  console.log('Received request to delete patient photo');
  try {
    const { id } = req.params;
    const photo = await PatientPhoto.findById(id);

    if (!photo) {
      return res.status(404).json({ message: 'Patient photo not found' });
    }

    // Extract the public ID from the Cloudinary URL
    const publicId = photo.PhotoPath.split('/').pop().split('.')[0];

    // Delete the image from Cloudinary
    await cloudinary.uploader.destroy(`patient_photos/${publicId}`);

    // Mark the photo as deleted in the database
    photo.IsDeleted = true;
    await photo.save();

    res.status(200).json({ message: 'Patient photo marked as deleted', photo });
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};
exports.getPatientPhotos = async (req, res) => {
  console.log('Received request to get patient photos');
  try {
    const { patientId } = req.params;
    const photos = await PatientPhoto.find({ PatientID: patientId, IsDeleted: false });

    if (photos.length > 0) {
      res.status(200).json(photos);
    } else {
      res.status(404).json({ message: 'No photos found for the specified patient' });
    }
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};

exports.getPatientPhotosByCategory = async (req, res) => {
  console.log('Received request to get patient photos by category');
  try {
    const { patientId, categoryId } = req.params;
    const photos = await PatientPhoto.find({ PatientID: patientId, AlbumCategoryListID: categoryId, IsDeleted: false });

    if (photos.length > 0) {
      res.status(200).json(photos);
    } else {
      res.status(404).json({ message: 'No photos found for the specified patient and category' });
    }
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};
