CREATE TABLE TABLE_USER(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, -- used to check if record is active or not, substitute isDeleted column
	firstName nvarchar(255) NOT NULL,
	lastName nvarchar(255) NOT NULL,
	preferredName nvarchar(255),
	nric nvarchar(9) UNIQUE NOT NULL,
	address nvarchar(255) NOT NULL,
	dateOfBirth datetime2 NOT NULL,
	gender nvarchar(1) NOT NULL,
	contactNo nvarchar(32) NOT NULL,
	allowNotification nvarchar(1) default 'Y' NOT NULL,
	profilePicture nvarchar(255),
	lockoutReason nvarchar(255),

	loginTimeStamp datetime2 NOT NULL,
	lastPasswordChanged datetime2 NOT NULL,
	status nvarchar(255) NOT NULL,

	userName nvarchar(255) NOT NULL,
	email nvarchar(255) NOT NULL,
	emailConfirmed nvarchar(1) default 'N' NOT NULL,
	passwordHash nvarchar(255) NOT NULL,
	
	securityStamp nvarchar(255),
	concurrencyStamp nvarchar(255),

	phoneNumber nvarchar(32),
	phoneNumberConfirmed nvarchar(1) default 'N' NOT NULL,
	twoFactorEnabled nvarchar(1) default 'N' NOT NULL,
	lockOutEnd datetime2,
	lockOutEnabled nvarchar(1),
	accessFailedCount bigint,



	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id) NOT NULL,
	modifiedById numeric(19)FOREIGN KEY REFERENCES TABLE_USER(id)  NOT NULL

	--whats the difference between phone number n contact no?????

);

CREATE TABLE ROLES(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	role nvarchar(255) NOT NULL,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id) NOT NULL,
	modifiedById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id) NOT NULL
);

CREATE TABLE USER_ROLES(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	userId numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id),
	roleId numeric(19) FOREIGN KEY REFERENCES ROLES(id)
);

CREATE TABLE SECRET_QUESTION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	value nvarchar(255) NOT NULL,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id)  NOT NULL,
	modifiedById numeric(19)FOREIGN KEY REFERENCES TABLE_USER(id)  NOT NULL

);

CREATE TABLE USER_SECRET_QUESTION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	userId numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id) NOT NULL,
	secretQuestionId numeric(19) FOREIGN KEY REFERENCES SECRET_QUESTION(id) NOT NULL,
	secretQuestionAnswer nvarchar(255) NOT NULL,


	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id) NOT NULL,
	modifiedById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id) NOT NULL

);
