CREATE TABLE ACTIVITY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	title nvarchar(255),
	description nvarchar(255),
	startDate datetime2,
	endDate datetime2,
	
	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);

CREATE TABLE ACTIVITY_AVAILABILIY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	activityId numeric(19) FOREIGN KEY REFERENCES ACTIVITY(id),
	startTime bigint,
	endTime bigint,


	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
	--removed day column

);


CREATE TABLE ACTIVITY_EXCLUSION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	activityId numeric(19) FOREIGN KEY REFERENCES ACTIVITY(id),
	exclusionRemarks nvarchar(255),
	startDate datetime2,
	endDate datetime2,
	
	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);

CREATE TABLE ADHOC(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	patientId numeric(19),
	oldActivityId numeric(19) FOREIGN KEY REFERENCES ACTIVITY(id),
	newActivityId numeric(19) FOREIGN KEY REFERENCES ACTIVITY(id),
	status nvarchar(255),
	startDate datetime2,
	endDate datetime2,
	
	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);


CREATE TABLE CARECENTRE(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(255) NOT NULL,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	countryId numeric(19),  --refer list microservice
	address nvarchar(255),
	postalCode bigint,
	contactNo nvarchar(32),
	email nvarchar(255),
	noOfDevicesAvailable bigint,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);

CREATE TABLE CARECENTRE_HOURS(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	centreId numeric(19) FOREIGN KEY REFERENCES CARECENTRE(id),
	workingDay nvarchar(9),
	openingHours bigInt,
	closingHours bigInt,
	remarks nvarchar(255), --new column in case they wanna put when their lucnh is or what

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
	--BE TO ADD LIMIT SUCH THAT NO MORE THAN 7 ACTIVE RECORDS PER CARECENTRE

);

CREATE TABLE CENTRE_ACTIVITY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	activityId numeric(19) FOREIGN KEY REFERENCES ACTIVITY(id),
	isCompulsory nvarchar(1),
	isFixed nvarchar(1),
	isGroup nvarchar(1),
	minDuration bigint,
	maxDuration bigint,
	minPeopleReq bigInt,
	fixedTimeSlots nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL
);

CREATE TABLE CENTRE_ACTIVITY_PREFERENCE(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	centreActivityId numeric(19) FOREIGN KEY REFERENCES CENTRE_ACTIVITY(id) NOT NULL ,
	patientId numeric(19)  NOT NULL,
	isLike nvarchar(1) NOT NULL,


	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);

CREATE TABLE CENTRE_ACTIVITY_RECOMMENDATION(
	
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	centreActivityId numeric(19) FOREIGN KEY REFERENCES CENTRE_ACTIVITY(id) NOT NULL ,
	patientId numeric(19)  NOT NULL,
	doctorId numeric(19),
	isDoctorRecommended nvarchar(1),
	doctorRemarks nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);


