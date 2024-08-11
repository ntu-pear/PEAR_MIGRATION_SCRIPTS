CREATE TABLE PRIVACY_LEVEL_SETTING(

	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL, 
	roleId numeric(19) FOREIGN KEY REFERENCES ROLES NOT NULL,
	privacyLevelSensitive bigint NOT NULL,
	privacyLevelNonSensitive bigint NOT NULL,

	createdDate datetime2  NOT NULL,
	modifiedDate datetime2 DEFAULT GETDATE() NOT NULL,
	createdById numeric(19) FOREIGN KEY REFERENCES TABLE_USER(id)  NOT NULL,
	modifiedById numeric(19)FOREIGN KEY REFERENCES TABLE_USER(id)  NOT NULL
);


