CREATE TABLE GAME(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	name nvarchar(255),
	description nvarchar(255),
	manifest nvarchar(255),
	duration bigint,
	rating bigint,
	difficult bigint,
	gameCreatedBy nvarchar(255),
	gameCreatedById numeric(19),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE GAME_CATEGORY(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	gameId numeric(19) FOREIGN KEY REFERENCES GAME(id),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE PERFORMANCE_METRIC_NAME(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	name nvarchar(255),
	detail nvarchar(500),

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE GAME_PERFORMANCE_METRIC_ORDER(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	perfMetricNameId numeric(19) FOREIGN KEY REFERENCES PERFORMANCE_METRIC_NAME(id),
	gameId numeric(19) FOREIGN KEY REFERENCES GAME(id),
	metricOrder bigint,


	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE ASSIGNED_GAME(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	patientId numeric(19) NOT NULL,
	gameId numeric(19) NOT NULL,
	assignRemarks nvarchar(255),
	gameTherapistId numeric(19),
	recommendationReason nvarchar(500),
	rejectionReason nvarchar(500),
	endDate datetime2,
	

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);

CREATE TABLE GAME_RECORD(
	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	assignedGameId numeric(19),
	score bigint,
	timetaken bigint,
	performanceMetricsValues bigint,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19)   NOT NULL,
	modifiedById numeric(19)  NOT NULL

);