const { body } = require('express-validator');

exports.validate = (method) => {
  switch (method) {
    case 'addRoutine': {
      return [
        body('ActivityID', 'ActivityID is required').exists(),
        body('PatientID', 'PatientID is required').exists(),
        body('IncludeInSchedule', 'IncludeInSchedule is required').exists().isBoolean()
      ];
    }
  }
};
