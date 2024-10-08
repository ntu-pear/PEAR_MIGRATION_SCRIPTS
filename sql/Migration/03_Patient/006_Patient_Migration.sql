USE old_fyp_db
GO

insert into patient.dbo.PATIENT_GUARDIAN(active,firstName,lastName,preferredName,gender,contactNo,nric,email,dateOfBirth,address,tempAddress,relationshipId,guardianApplicationUserId,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when g.IsDeleted = 0 THEN 'Y' ELSE 'N' END),g.FirstName,g.LastName,g.PreferredName,g.Gender,g.ContactNo,g.NRIC,g.Email,g.DOB,g.Address,g.TempAddress,(Select id from list.dbo.LIST_TABLE where type='relationship' and value=lr.Value),
(CASE when g.GuardianApplicationUserId IS NOT NULL THEN (select id from [user].dbo.TABLE_USER where nric=g.NRIC) ELSE NULL END),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Guardian g
join List_Relationship lr on g.RelationshipID=lr.List_RelationshipID;


insert into patient.dbo.PATIENT(active,firstName,lastName,nric,address,tempAddress,handphoneNo,gender,dateOfBirth,guardianId,preferredName,preferredLanguageId,updateBit,autoGame,startDate,endDate,patientStatus,terminationReason,patientStatusinActiveReason,patientStatusInActiveDate,profilePicture,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when p.IsDeleted = 0 THEN 'Y' ELSE 'N' END),p.FirstName,p.LastName,p.Nric,p.Address,p.TempAddress,p.HandphoneNo,p.Gender,p.DOB,(select id from patient.dbo.PATIENT_GUARDIAN  ppg where ppg.nric=g.NRIC),p.PreferredName,(select id from list.dbo.LIST_TABLE where value=ll.Value and type='language'),p.UpdateBit,p.AutoGame,p.StartDate,p.EndDate,p.IsRespiteCare,
p.TerminationReason,p.InactiveReason,p.InactiveDate,p.ProfilePicture,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Patient p
join PatientAllocation pa on p.PatientID=pa.PatientID
join Guardian g on g.GuardianID = pa.GuardianID
join List_Language ll on p.PreferredLanguageListID = ll.List_LanguageID;

--check is approved n office no columns in patient table
--update foreignkey constrain on pateint allergy before executing, ADD to ddls

insert into patient.dbo.PATIENT_ALLOCATION(active,patientId,doctorId,gameTherapistId,supervisorId,caregiverId,guardianId,tempDoctorId,tempCaregiverId,guardian2Id,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when p.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),(select id from [user].dbo.TABLE_USER where nric = d.Nric),
(select id from [user].dbo.TABLE_USER where nric = gt.Nric),(select id from [user].dbo.TABLE_USER where nric = s.Nric),(select id from [user].dbo.TABLE_USER where nric = c.Nric),(select id from patient.dbo.PATIENT_GUARDIAN where nric = g.Nric),
(select id from [user].dbo.TABLE_USER where nric = td.Nric),(select id from [user].dbo.TABLE_USER where nric = tc.Nric),(select id from patient.dbo.PATIENT_GUARDIAN where nric = g2.Nric),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from PatientAllocation pa
left join Patient p on pa.PatientID =  p.PatientID
left join AspNetUsers d on pa.DoctorID=d.Id
left join AspNetUsers gt on pa.GametherapistID=gt.Id
left join AspNetUsers s on pa.SupervisorID=s.Id
left join AspNetUsers c on pa.CaregiverID=c.Id
left join Guardian g on pa.GuardianID=g.GuardianID
left join AspNetUsers  td on pa.TempDoctorID=td.id
left join AspNetUsers tc on pa.TempCaregiverID=tc.id
left join Guardian g2 on pa.GuardianID=g2.GuardianID;


insert into patient.dbo.PATIENT_ALLERGY(active,patientId,allergyListId,allergyReactionListId,allergyRemarks,createdDate,modifiedDate,createdDate,modifiedById)
select
(CASE when a.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),(select id from list.dbo.LIST_TABLE lt where lt.type='allergy' and lt.value= la.Value),
(select id from list.dbo.LIST_TABLE lt where lt.type='allergyReaction' and lt.value= ar.Value),a.AllergyRemarks,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Allergy a
left join Patient p on a.PatientID = p.PatientID
left join List_Allergy la on a.AllergyListID = la.List_AllergyID
left join List_AllergyReaction ar on a.AllergyReactionListID = ar.List_AllergyReactionID;


insert into patient.dbo.PATIENT_ATTENDANCE(active,patientId,attendanceDate,arrivalTime,departureTime,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when al.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),attendanceDate, arrivalTime,departureTime,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from AttendanceLog al
left join Patient p on al.PatientID = p.PatientID;


insert into patient.dbo.PATIENT_DOCTORNOTE(active,patientId,doctorId,doctorRemarks,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when dn.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),(select id from [user].dbo.table_user tu where anu.Nric=tu.nric),DoctorRemarks,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from DoctorNote dn 
left join Patient p on dn.PatientID = p.PatientID
left join AspNetUsers anu on dn.DoctorID=anu.id;


insert into patient.dbo.PATIENT_HIGHLIGHT(active,patientId,type,highlightJSON,startDate,endDate,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when h.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),ht.Value,HighlightJson,h.StartDate,h.EndDate,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Highlight h
left join Patient p on h.PatientID = p.PatientID
left join HighlightType ht on h.HighlightTypeID=ht.HighlightTypeID;


insert into patient.dbo.PATIENT_MOBILITY(active,patientId,mobilityListId,remarks,status,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when m.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),(select id from list.dbo.LIST_TABLE lt where lt.type='mobility' and lt.value= lm.Value),MobilityRemark,
(CASE when m.IsRecovered = 0 THEN 'NOTRECOVERED' ELSE 'RECOVERED' END),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Mobility  m
left join Patient p on m.PatientID = p.PatientID
left join List_Mobility lm on m.MobilityListID=lm.List_MobilityID;



insert into patient.dbo.PATIENT_PHOTO(active,patientId,photoPath,albumCategoryListId,photoDetails,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when pp.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),PhotoPath,(select id from list.dbo.LIST_TABLE lt where lt.type='albumCategory' and lt.value= ac.Value),PhotoDetails,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from PatientPhoto pp
left join Patient p on pp.PatientID = p.PatientID
left join List_AlbumCategory ac on pp.AlbumCategoryListID=ac.List_AlbumCatID;


insert into patient.dbo.PATIENT_PRESCRIPTION(active,patientId,prescriptionListId,dosage,frequencyPerDay,instruction,startDate,endDate,afterMeal,prescriptionRemarks,status,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when pp.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),(select id from list.dbo.LIST_TABLE lt where lt.type='prescription' and lt.value= lp.Value),dosage,FrequencyPerDay,Instruction,
pp.StartDate,pp.EndDate,AfterMeal,PrescriptionRemarks,(CASE when pp.IsChronic = 0 THEN 'NOTCHRONIC' ELSE 'CHRONIC' END),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Prescription pp
left join Patient p on pp.PatientID = p.PatientID
left join List_Prescription lp on pp.PrescriptionListID = lp.List_PrescriptionID;


insert into patient.dbo.PATIENT_VITAL(active,patientId,afterMeal,temperature,systolicBP,diastolicBP,heartRate,spO2,bloodSugarLevel,height,weight,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when v.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),AfterMeal,Temperature,SystolicBP,DiastolicBP,HeartRate,SpO2,BloodSugarlevel,Height,Weight,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from Vital v
left join Patient p on v.PatientID = p.PatientID





insert into patient.dbo.PATIENT_SOCIAL_HISTORY(active,patientId,sexuallyActive,secondHandSmoker,alcoholUse,caffeineUse,tobaccoUse,drugUse,exercise,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when sh.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.Nric),sh.sexuallyActive,sh.secondHandSmoker,sh.alcoholUse,caffeineUse, tobaccoUse, drugUse,exercise,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )

from SocialHistory sh
left join Patient p on sh.PatientID=p.PatientID;


insert into patient.dbo.PATIENT_SOCIAL_HISTORY_LIST_MAPPING(socialHistoryId,listId)
select 
(select id from patient.dbo.PATIENT_SOCIAL_HISTORY psh where psh.patientId=(select id from patient.dbo.PATIENT pdp where pdp.nric=p.Nric)),
(select id from list.dbo.LIST_TABLE lt where lt.type='diet' and lt.value= ld.Value)

from SocialHistory sh 
left join Patient p on sh.PatientID=p.PatientID
left join List_Diet ld on sh.DietListID = ld.List_DietID;


insert into patient.dbo.PATIENT_SOCIAL_HISTORY_LIST_MAPPING(socialHistoryId,listId)
select 
(select id from patient.dbo.PATIENT_SOCIAL_HISTORY psh where psh.patientId=(select id from patient.dbo.PATIENT pdp where pdp.nric=p.Nric)),
(select id from list.dbo.LIST_TABLE lt where lt.type='religion' and lt.value= lr.Value)

from SocialHistory sh 
left join Patient p on sh.PatientID=p.PatientID
left join List_Religion lr on sh.ReligionListID = lr.List_ReligionID;

insert into patient.dbo.PATIENT_SOCIAL_HISTORY_LIST_MAPPING(socialHistoryId,listId)
select 
(select id from patient.dbo.PATIENT_SOCIAL_HISTORY psh where psh.patientId=(select id from patient.dbo.PATIENT pdp where pdp.nric=p.Nric)),
(select id from list.dbo.LIST_TABLE lt where lt.type='pet' and lt.value= l.Value)

from SocialHistory sh 
left join Patient p on sh.PatientID=p.PatientID
left join List_Pet l on sh.PetListID = l.List_PetID;

insert into patient.dbo.PATIENT_SOCIAL_HISTORY_LIST_MAPPING(socialHistoryId,listId)
select 
(select id from patient.dbo.PATIENT_SOCIAL_HISTORY psh where psh.patientId=(select id from patient.dbo.PATIENT pdp where pdp.nric=p.Nric)),
(select id from list.dbo.LIST_TABLE lt where lt.type='occupation' and lt.value= ld.Value)

from SocialHistory sh 
left join Patient p on sh.PatientID=p.PatientID
left join List_Occupation ld on sh.OccupationListID = ld.List_OccupationID;

insert into patient.dbo.PATIENT_SOCIAL_HISTORY_LIST_MAPPING(socialHistoryId,listId)
select 
(select id from patient.dbo.PATIENT_SOCIAL_HISTORY psh where psh.patientId=(select id from patient.dbo.PATIENT pdp where pdp.nric=p.Nric)),
(select id from list.dbo.LIST_TABLE lt where lt.type='education' and lt.value= ld.Value)

from SocialHistory sh 
left join Patient p on sh.PatientID=p.PatientID
left join List_Education ld on sh.EducationListID = ld.List_EducationID;

insert into patient.dbo.PATIENT_SOCIAL_HISTORY_LIST_MAPPING(socialHistoryId,listId)
select 
(select id from patient.dbo.PATIENT_SOCIAL_HISTORY psh where psh.patientId=(select id from patient.dbo.PATIENT pdp where pdp.nric=p.Nric)),
(select id from list.dbo.LIST_TABLE lt where lt.type='liveWith' and lt.value= ld.Value)

from SocialHistory sh 
left join Patient p on sh.PatientID=p.PatientID
left join List_LiveWith ld on sh.LiveWithListID = ld.List_LiveWithID;













































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































