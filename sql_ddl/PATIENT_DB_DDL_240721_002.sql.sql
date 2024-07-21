CREATE TABLE PATIENT(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	nric nvarchar(9) UNIQUE NOT NULL,
	address nvarchar(255), 
	tempAddress nvarchar(255), 
	officeNo nvarchar(32),
	handphoneNo nvarchar(32),
	gender nvarchar(1) NOT NULL,
	dateOfBirth datetime2 NOT NULL,

	guardianId numeric(19), --if there is a guardian in the system mapping shld be done with patient table using guardianId
	--shld this column be kept? bcos it it also referenced in patient allocation table
	isApproved nvarchar(1), -- check this columns usage,
	preferredName nvarchar(255), 
	preferredLanguageId numeric(19), -- references list microservice ID

	updateBit bigInt , -- check this columns usage,
	autoGame bigInt, -- check this columns usage,

	startDate datetime2 NOT NULL,
	endDate datetime2,
	patientStatus nvarchar(255) NOT NULL, --used in place of isActive and isRespiteCare, if any future status to be added, add to this 
	terminationReason nvarchar(255),
	patientStatusinActiveReason nvarchar(255), --linked to patientStatus inactive NOT active column
	patientStatusInActiveDate nvarchar(255), --linked to patientStatus inactive NOT active column

	profilePicture nvarchar(255), -- if not enuf alter column -- why have this if also have patientPhoto table


	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);


-- things to consider, shld officeNo and handphoneNo be restricted to 8 digits like SG numbers? 
-- to be on the safe side they have been restricted to 32 and allow nvarchar characters for overseas numbers


--all tables in the patient microservice to follow patient_X naming convention

CREATE TABLE PATIENT_LIST(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL,

	type nvarchar(255)  NOT NULL ,
	value nvarchar(255) NOT NULL,
	listOrder bigInt,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

	-- all the list tables are combined

);


CREATE TABLE PATIENT_ALLERGY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	allergyListId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id),
	allergyReactionListId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id),
	allergyRemarks nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);

CREATE TABLE PATIENT_DOCTORNOTE(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	doctorId numeric(19),
	doctorRemarks nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2  DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL


);

CREATE TABLE PATIENT_GUARDIAN(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	preferredName nvarchar(255),
	gender nvarchar(1) NOT NULL,
	contactNo nvarchar(32) NOT NULL,
	nric nvarchar(9) NOT NULL,
	email nvarchar(255),
	dateOfBirth datetime2 NOT NULL,
	address nvarchar(255) NOT NULL,
	tempAddress nvarchar(255),
	relationshipId numeric(19) NOT NULL FOREIGN KEY REFERENCES PATIENT_LIST(id), 
	status nvarchar(255) NOT NULL,
	guardianApplicationUserId numeric(19),


	createdDate datetime2  NOT NULL,
	modifiedDate datetime2  DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);


CREATE TABLE PATIENT_ALLOCATION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	doctorId numeric(19) NOT NULL, --references user microservice
	gameTherapistId numeric(19) NOT NULL, --references user microservice
	supervisorId numeric(19) NOT NULL, --references user microservice
	caregiverId numeric(19) NOT NULL, --references user microservice
	guardianId numeric(19) FOREIGN KEY REFERENCES PATIENT_GUARDIAN(id) NOT NULL,
	tempDoctorId numeric(19), --references user microservice
	tempCaregiverId numeric(19),--references user microservice
	guardian2Id numeric(19) FOREIGN KEY REFERENCES PATIENT_GUARDIAN(id),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2  DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);

CREATE TABLE PATIENT_PHOTO(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	photoPath nvarchar(255),
	albumCategoryListId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id), --references list microservice

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);

CREATE TABLE PATIENT_ASSIGNED_DEMENTIA(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	dementiaTypeListId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id), --references list microservice

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);

CREATE TABLE PATIENT_MOBILITY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	mobilityListId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id), --references list microservice
	status nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);

CREATE TABLE PATIENT_PRESCRIPTION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	prescriptionListId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id), --references list microservice
	dosage nvarchar(255),
	frequencyPerDay bigint,
	instruction nvarchar(255),
	startDate datetime2,
	endDate datetime2,
	afterMeal nvarchar(1),
	prescriptionRemarks nvarchar(255),
	status nvarchar(255), --used in place of ischronic

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE()  NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);

CREATE TABLE PATIENT_SOCIAL_HISTORY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	sexuallyActive nvarchar(1),
	secondHandSmoker nvarchar(1),
	alcoholUse nvarchar(1),
	caffeineUse nvarchar(1),
	tobaccoUse nvarchar(1),
	drugUse nvarchar(1),
	exercise nvarchar(1),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);

CREATE TABLE PATIENT_SOCIAL_HISTORY_LIST_MAPPING(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	socialHistoryId numeric(19) FOREIGN KEY REFERENCES PATIENT_SOCIAL_HISTORY(id),
	listId numeric(19) FOREIGN KEY REFERENCES PATIENT_LIST(id),
	 
);

CREATE TABLE PATIENT_VITAL(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	afterMeal nvarchar(1),
	temperature float(5),
	systolicBP bigint,
	diastolicBP bigint,
	heartRate bigint,
	spO2 bigint,
	bloodSugarLevel bigint,
	height float(5),
	weight float(5),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

	--shld all these columns be big int... shld change to float?

);

CREATE TABLE PATIENT_ATTENDANCE(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	attendanceDate datetime2,
	arrivalTime bigint, --check if ok?
	departureTime bigint, --check if ok?

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2  DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL


	-- removed dat column thats nonsense BE or FE can get day using date...
);

CREATE TABLE PATIENT_HIGHLIGHT(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19) FOREIGN KEY REFERENCES PATIENT(id),
	type nvarchar(255),
	highlightJSON nvarchar(255), --wtfuck
	startDate datetime2,
	endDate datetime2,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);




--scrap vital threshold table THATS STUPID fix from FE wthell and add BE check
--hightlight type table thrown away, add type restriction from BE...
--add patient table foreign key referencing guardian table