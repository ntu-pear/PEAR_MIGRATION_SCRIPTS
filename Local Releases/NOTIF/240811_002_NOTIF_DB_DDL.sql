CREATE TABLE SCENARIO(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	requestorRole numeric(19) NOT NULL,
	requesteeRole  numeric(19)   NOT NULL,
	tableAffected nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL


);

CREATE TABLE SCENARIO_PROCEDURE(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	stepNumber bigint,
	isApprovalRequest  nvarchar(1) ,
	nextStep nvarchar(255),
	notificationRecieverRole nvarchar(255), 
	notificationMessage nvarchar(255), 

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL
);


CREATE TABLE LOG(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
--	active nvarchar(1) default 'Y' NOT NULL,  a log cannot be inactive, it is a record
	relatedLogId numeric(19),
	userId numeric(19),
	patientId numeric(19),
	tableAffected nvarchar(255),
	actionType nvarchar(255),
	data nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE APPROVAL_REQUEST(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	logId numeric(19)  FOREIGN KEY REFERENCES LOG(id)  NOT NULL,
	requestorUserId numeric(19) NOT NULL ,
	requesteeUserId numeric(19) NOT NULL,
	thirdPartyUserId numeric(19) NOT NULL,
	status nvarchar(255), 
	scenarioId numeric(19)  NOT NULL,
	stepNumber bigInt,
	modificationEnabled nvarchar(1),
	rejectReason nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)  NOT NULL,
	modifiedById numeric(19)  NOT NULL
);

CREATE TABLE NOTIFICATION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	logId numeric(19) FOREIGN KEY REFERENCES LOG(id),
	approvalRequestId numeric(19) FOREIGN KEY REFERENCES APPROVAL_REQUEST(id),
	recieverUserId numeric(19),
	message nvarchar(255),
	readStatus nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)  NOT NULL,
	modifiedById numeric(19)  NOT NULL
	
);

CREATE TABLE PROBLEM_LOG(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	userId numeric(19),
	patientId numeric(19),
	problemLogListId numeric(19),
	problemLogRemarks nvarchar(255),
	
	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL
);



CREATE TABLE LOG_ACCOUNT(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	adminId numeric(19),
	affectedUserId numeric(19),
	category nvarchar(255),
	actionType nvarchar(255),
	data nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);



CREATE TABLE storedNotification(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	notificationType nvarchar(255),
	serializedNotification nvarchar(255),
	senderUserId numeric(19), -- if this isnt a user ID RIP

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL
);


CREATE TABLE AUDIT_LOG(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	userId numeric(19),
	notificationId numeric(19) FOREIGN KEY REFERENCES NOTIFICATION(id),
	mainLogId numeric(19),
	action nvarchar(255),
	comment nvarchar(255),



	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL
);

CREATE TABLE NOTIFICATION_SCENARIO(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	scenarioId numeric(19) FOREIGN KEY REFERENCES SCENARIO(id),
	parentScenarioId numeric(19),
	scenarioName nvarchar(255),
	initiatorRole nvarchar(255),
	notificationType nvarchar(255),
	messageTemplate nvarchar(255),
	originalMessageTemplate nvarchar(255),
	action nvarchar(255),
	recipientKey nvarchar(255),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE SENT_NOTIFICATION(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	userId numeric(19),
	notificationId numeric(19) FOREIGN KEY REFERENCES NOTIFICATION(id),
	

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);