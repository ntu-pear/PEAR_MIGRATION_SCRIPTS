USE [old_fyp_db]
GO
--temp table
SELECT * INTO list.dbo.temp_list FROM(

select 'religion' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value, GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate from [dbo].List_Religion UNION

select 'secretQuestion' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate from [dbo].List_SecretQuestion UNION

select 'relationship' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate from [dbo].List_Relationship UNION

select 'problemLog' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_ProblemLog UNION

select 'prescription' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate  from [dbo].List_Prescription UNION

select 'pet' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_Pet UNION

select 'occupation' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate  from [dbo].List_Occupation UNION

select 'mobility' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_Mobility UNION

select 'liveWith' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_LiveWith UNION

select 'likeDislike' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_LikeDislike UNION

select 'language' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_Language UNION

select 'hobby' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value  ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate  from [dbo].List_Hobby UNION

select 'habit' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate  from [dbo].List_Habit UNION

select 'gamecategory' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate  from [dbo].List_GameCategory UNION

select 'education' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_Education UNION

select 'diet' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_Diet UNION

select 'dementiaType' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_DementiaType UNION

select 'country' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate  from [dbo].List_Country UNION

select 'allergyReaction' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate from [dbo].List_AllergyReaction  UNION

select 'allergy' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById ,GETDATE() as modifiedDate  from [dbo].List_Allergy UNION

select 'albumCategory' as type, (CASE when IsDeleted = 0 THEN 'Y' ELSE 'N' END) as active, value as value ,GETDATE() as createdDate, (select id from [user].dbo.table_user where firstname='system' ) as createdById, (select id from [user].dbo.table_user where firstname='system' ) as modifiedById  ,GETDATE() as modifiedDate  from [dbo].List_AlbumCategory 

) as X


--validation check after migration

SELECT type, count(type) AS CountOf
FROM list.dbo.temp_list 
GROUP BY type

--after this step, generate out insert statements and then replace the table name with target table name.

