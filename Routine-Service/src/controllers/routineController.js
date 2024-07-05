const { validationResult } = require('express-validator');
const Routine = require('../models/Routine');

exports.addRoutine = async (req, res) => {
  console.log('Received request to add routine');
  console.log('Request body:', req.body);

  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    console.log('Validation errors:', errors.array());
    return res.status(400).json({ errors: errors.array() });
  }

  try {
    const { ActivityID, PatientID, RoutineIssues, IncludeInSchedule } = req.body;

    const newRoutine = new Routine({
      ActivityID,
      PatientID,
      RoutineIssues,
      IncludeInSchedule
    });

    await newRoutine.save();
    res.status(201).json(newRoutine);
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};

exports.getPatientRoutines = async (req, res) => {
  console.log('Received request to get patient routines');
  try {
    const { patientId } = req.params;
    const routines = await Routine.find({ PatientID: patientId, IsDeleted: false });

    if (routines.length > 0) {
      res.status(200).json(routines);
    } else {
      res.status(404).json({ message: 'No routines found for the specified patient' });
    }
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};

exports.deleteRoutine = async (req, res) => {
  console.log('Received request to delete routine');
  try {
    const { id } = req.params;
    const deletedRoutine = await Routine.findByIdAndUpdate(id, { IsDeleted: true }, { new: true });

    if (deletedRoutine) {
      res.status(200).json({ message: 'Routine marked as deleted', deletedRoutine });
    } else {
      res.status(404).json({ message: 'Routine not found' });
    }
  } catch (error) {
    console.log('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
};
