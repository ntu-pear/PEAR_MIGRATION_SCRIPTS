--validation checks
SELECT count(*) from temp_users_table



SELECT count(*) from temp_List_SecretQuestion

insert into SECRET_QUESTION(value,createdDate,createdById,modifiedById,active)
select value,GETDATE(),(select id from TABLE_USER where firstName='system') ,(select id from TABLE_USER where firstName='system'),'Y'
from temp_List_SecretQuestion

select count(*) from SECRET_QUESTION


insert into TABLE_USER(firstName,lastName,preferredName,nric,address,dateOfBirth,gender,contactNo,profilePicture,loginTimeStamp,lastPasswordChanged,status,userName,email,passwordHash,
createdDate,createdById,modifiedById)
select FirstName,LastName,PreferredName,Nric,Address,DOB,Gender,contactNo,
ProfilePicture,LoginTimeStamp,LastPasswordChanged,'ACTIVE',UserName,Email, 
PasswordHash,GETDATE(),(select id from TABLE_USER where firstName='system') ,(select id from TABLE_USER where firstName='system')
from  temp_users_table

select count(*) from TABLE_USER


select count(*) from AspNetRoles

insert into ROLES(role,active,createdDate,createdById,modifiedById)
select NormalizedName,'Y',GETDATE(),(select id from TABLE_USER where firstName='system') ,(select id from TABLE_USER where firstName='system')
from  AspNetRoles

select count(*) from ROLES


insert into USER_ROLES(userId,roleId)
select 
 tu.id ,r.id
from table_USER tu
join temp_users_table tut on tu.firstName=tut.FirstName
join roles r on r.role=tut.NormalizedName

select * from USER_SECRET_QUESTION

insert into USER_SECRET_QUESTION(userId,secretQuestionId,secretQuestionAnswer,createdDate,createdById,modifiedById)
select tu.id, sq.id, tut.SecretAnswer1,GETDATE(),(select id from TABLE_USER where firstName='system') ,(select id from TABLE_USER where firstName='system')

from temp_users_table tut 
join table_User tu on tu.firstName=tut.FirstName
join secret_Question sq on tut.secretQuestion1 = sq.value


insert into USER_SECRET_QUESTION(userId,secretQuestionId,secretQuestionAnswer,createdDate,createdById,modifiedById)
select tu.id, sq.id, tut.SecretAnswer2,GETDATE(),(select id from TABLE_USER where firstName='system') ,(select id from TABLE_USER where firstName='system')

from temp_users_table tut 
join table_User tu on tu.firstName=tut.FirstName
join secret_Question sq on tut.secretQuestion2 = sq.value


DROP TABLE temp_users_table;
DROP TABLE temp_List_SecretQuestion;
DROP TABLE AspNetRoles;