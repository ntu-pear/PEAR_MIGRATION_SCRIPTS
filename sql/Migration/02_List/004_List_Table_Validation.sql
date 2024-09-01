USE [old_fyp_db]
GO
--validation checks
SELECT 'albumCategory', count(*) as count from [dbo].List_AlbumCategory UNION
SELECT 'allergy' , count(*) as count from [dbo].List_Allergy UNION
SELECT 'allergyReaction' , count(*) as count from [dbo].List_AllergyReaction UNION
SELECT 'country' , count(*) as count from [dbo].List_Country UNION
SELECT 'dementiaType' , count(*) as count from [dbo].List_DementiaType UNION
SELECT 'diet' , count(*) as count from [dbo].List_Diet UNION
SELECT  'education', count(*) as count from [dbo].List_Education UNION
SELECT 'gameCategory' , count(*) as count from [dbo].List_GameCategory UNION
SELECT 'habit' , count(*) as count from [dbo].List_Habit UNION
SELECT 'hobby' , count(*) as count from [dbo].List_Hobby UNION
SELECT 'language' , count(*) as count from [dbo].List_Language UNION
SELECT 'likeDislike', count(*) as count from [dbo].List_LikeDislike UNION
SELECT 'liveWith', count(*) as count from [dbo].List_LiveWith UNION
SELECT 'mobility', count(*) as count from [dbo].List_Mobility UNION
SELECT 'occupation', count(*) as count from [dbo].List_Occupation UNION
SELECT 'pet' , count(*) as count from [dbo].List_Pet UNION
SELECT 'prescription' , count(*) as count from [dbo].List_Prescription  UNION
SELECT 'problemlog' , count(*) as count from [dbo].List_ProblemLog UNION
SELECT 'relationship' , count(*) as count from [dbo].List_Relationship UNION
SELECT 'religion' , count(*) as count from [dbo].List_Religion UNION
SELECT 'secretQuestion', count(*) as count from [dbo].List_SecretQuestion 
