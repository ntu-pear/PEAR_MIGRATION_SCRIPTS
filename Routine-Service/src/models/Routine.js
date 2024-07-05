const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const RoutineSchema = new Schema({
  ActivityID: { type: Number, required: true },
  PatientID: { type: Number, required: true },
  RoutineIssues: { type: String, required: false },
  IncludeInSchedule: { type: Boolean, required: true },
  IsDeleted: { type: Boolean, default: false }
}, {
  timestamps: true
});

module.exports = mongoose.model('Routine', RoutineSchema);
