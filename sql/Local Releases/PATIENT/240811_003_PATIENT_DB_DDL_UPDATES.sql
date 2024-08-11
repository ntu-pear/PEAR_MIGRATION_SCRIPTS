CREATE TABLE MEDICATION_LOG(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	prescriptionId numeric(19) FOREIGN KEY REFERENCES PATIENT_PRESCRIPTION(id),
	allocatedDateTime datetime2,
	servedBy nvarchar(255),
	servedById numeric(19),
	takenDateTime datetime2,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE()  NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL


);

