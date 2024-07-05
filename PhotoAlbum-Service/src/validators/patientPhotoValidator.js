const { body } = require('express-validator');

exports.validate = (method) => {
  switch (method) {
    case 'addPatientPhoto': {
      return [
        body('AlbumCategoryListID').isInt().withMessage('AlbumCategoryListID must be an integer'),
        body('PatientID').isInt().withMessage('PatientID must be an integer'),
        body('HolidayExperience').optional().custom((value) => {
          const parsed = JSON.parse(value);
          if (!parsed.CountryListID || !parsed.StartDate || !parsed.EndDate) {
            throw new Error('Invalid holiday experience');
          }
          return true;
        })
      ];
    }
    case 'updatePatientPhoto': {
      return [
        body('AlbumCategoryListID').optional().isInt().withMessage('AlbumCategoryListID must be an integer'),
        body('PatientID').optional().isInt().withMessage('PatientID must be an integer'),
        body('HolidayExperience').optional().custom((value) => {
          const parsed = JSON.parse(value);
          if (!parsed.CountryListID || !parsed.StartDate || !parsed.EndDate) {
            throw new Error('Invalid holiday experience');
          }
          return true;
        })
      ];
    }
  }
};
