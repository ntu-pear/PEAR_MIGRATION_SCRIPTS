const mongoose = require('mongoose');

const PatientPhotoSchema = new mongoose.Schema({
  PhotoPath: { type: String, required: true },
  PhotoDetails: { type: String },
  AlbumCategoryListID: { type: Number, required: true },
  PatientID: { type: Number, required: true },
  IsDeleted: { type: Boolean, default: false },
  CreatedDateTime: { type: Date, default: Date.now },
  UpdatedDateTime: { type: Date, default: Date.now },
  HolidayExperience: {
    CountryListID: { type: Number },
    StartDate: { type: Date },
    EndDate: { type: Date }
  }
});

module.exports = mongoose.model('PatientPhoto', PatientPhotoSchema);
