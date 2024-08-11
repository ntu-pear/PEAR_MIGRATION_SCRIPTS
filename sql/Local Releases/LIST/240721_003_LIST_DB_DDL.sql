CREATE TABLE LIST_TABLE(

	id numeric(19) IDENTITY(1,1) PRIMARY KEY,
	active nvarchar(1) default 'Y' NOT NULL,
	type nvarchar(255)  NOT NULL ,
	value nvarchar(255) NOT NULL,
	listOrder bigInt,
	createdDate datetime2  NOT NULL,
	modifiedDate datetime2  NOT NULL,
	createdById numeric(19) NOT NULL,
	modifiedById numeric(19) NOT NULL

);


--can have the following types: country, diet,dislike,education,habit,hobby,language,like,liveWith,occupation, prescription, problemlog,religion
--unsure what is listOrder