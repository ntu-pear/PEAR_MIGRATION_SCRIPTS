--validation checks
SELECT count(*) from AspNetUserRoles
SELECT count(*) from AspNetRoles
SELECT count(*) from List_SecretQuestion


--temp table
SELECT * INTO temp_users_table FROM
(select u.FirstName, u.LastName, u.PreferredName, u.Nric, u.Address,u.DOB,u.Gender,u.SecretQuestion1ListID,u.SecretAnswer1,u.SecretQuestion2ListID, u.SecretAnswer2,u.ContactNo,u.AllowNotification,u.ProfilePicture, 
u.LastPasswordChanged,u.LoginTimeStamp,u.UserName,u.Email,u.EmailConfirmed,u.PasswordHash,u.SecurityStamp,u.ConcurrencyStamp, u.PhoneNumberConfirmed, u.TwoFactorEnabled , r.NormalizedName, sq.Value as secretQuestion1,
sq2.value as secretQuestion2
 
from AspNetUsers u
 join AspNetUserRoles ur on u.id =ur.userId 
 join AspNetRoles r on ur.RoleId=r.Id
 join List_SecretQuestion sq on sq.List_SecretQuestionID =  u.SecretQuestion1ListID
 join List_SecretQuestion sq2 on sq2.List_SecretQuestionID =  u.SecretQuestion2ListID
) as X

select * from temp_users_table

SELECT count(*) from temp_users_table