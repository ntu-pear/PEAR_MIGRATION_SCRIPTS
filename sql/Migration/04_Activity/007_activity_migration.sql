USE old_fyp_db
GO

insert into activity.dbo.carecentre
(name,active,countryId,address,postalCode,contactNo,email,noOfDevicesAvailable,createdDate,modifiedDate,createdById,modifiedById)
select
cca.centreName, (CASE when cca.IsDeleted = 0 THEN 'Y' ELSE 'N' END), (select id from list.dbo.LIST_TABLE lt where lt.value=lc.value and lt.type='country' ),cca.centreAddress, cca.centrePostalCode, cca.centrecontactNo, cca.centreemail,cca.devicesavailable,GETDATE(),GETDATE(),
(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from CareCentreAttribute cca  
join List_Country lc on cca.CountryListID = lc.List_CountryID


insert into activity.dbo.CARECENTRE_HOURS(active,centreId,workingDay,openingHours,closingHours,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when cch.IsDeleted = 0 THEN 'Y' ELSE 'N' END), (select id from activity.dbo.CARECENTRE c where c.name=cca.centreName),
cch.centreworkingday, CONVERT(INT, REPLACE(CONVERT(VARCHAR(5),cast(cch.CentreOpeningHours as time) ,108), ':','')), CONVERT(INT, REPLACE(CONVERT(VARCHAR(5),cast(cch.CentreClosingHours as time) ,108), ':','')),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from  CareCentreHour cch
join CareCentreAttribute cca on cch.CentreID = cca.CentreID


insert into activity.dbo.ACTIVITY(active,title,description,startDate,endDate,createdDate,modifiedDate,createdById,modifiedById)
select 
(CASE when a.IsDeleted = 0 THEN 'Y' ELSE 'N' END), a.ActivityTitle,a.ActivityDesc,a.StartDate,a.EndDate,GETDATE(),GETDATE(),
(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from Activity a

insert into activity.dbo.ADHOC(active,patientId,oldActivityId,newActivityId,status,startDate,endDate,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when ah.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from patient.dbo.PATIENT where nric=p.nric),
(select id from Activity.dbo.ACTIVITY where title=oa.ActivityTitle and description=oa.ActivityDesc and startDate=oa.StartDate and endDate=oa.EndDate),
(select id from Activity.dbo.ACTIVITY where title=na.ActivityTitle and description=na.ActivityDesc and startDate=na.StartDate and endDate=na.EndDate),
ah.IsActive,ah.StartDate,ah.EndDate,GETDATE(),GETDATE(), (select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from AdHoc ah
join Patient p on p.PatientID = ah.PatientID
join Activity oa on oa.ActivityID=ah.OldActivityID
join Activity na on na.ActivityID=ah.NewActivityID


insert into activity.dbo.CENTRE_ACTIVITY(active,activityId,isCompulsory,isFixed,isGroup,minDuration,maxDuration,minPeopleReq,fixedTimeSlots,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when ca.IsDeleted = 0 THEN 'Y' ELSE 'N' END), (select id from Activity.dbo.ACTIVITY where title=a.ActivityTitle and description=a.ActivityDesc and startDate=a.StartDate and endDate=a.EndDate),
(CASE when ca.IsCompulsory = 0 THEN 'Y' ELSE 'N' END),(CASE when ca.IsFixed = 0 THEN 'Y' ELSE 'N' END),(CASE when ca.IsGroup = 0 THEN 'Y' ELSE 'N' END),ca.MinDuration,ca.MaxDuration,ca.MinPeopleReq,ca.fixedTimeSlots,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from CentreActivity ca
join Activity a on ca.ActivityID=a.ActivityID

insert into activity.dbo.CENTRE_ACTIVITY_PREFERENCE(active,centreActivityId,patientId,isLike,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when cap.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from activity.dbo.CENTRE_ACTIVITY aca join activity.dbo.ACTIVITY aa on aca.activityId=aa.id where aa.title =a.ActivityTitle and aa.description = a.ActivityDesc),
(select id from patient.dbo.PATIENT where nric=p.Nric),(CASE when cap.IsLike = 0 THEN 'Y' ELSE 'N' END),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from CentreActivityPreference cap 
join CentreActivity ca on ca.CentreActivityID=cap.CentreActivityID
join Activity a on ca.ActivityID=a.ActivityID
join Patient p on cap.[PatientID]=p.PatientID


insert into activity.dbo.CENTRE_ACTIVITY_RECOMMENDATION(active,centreActivityId,patientId,doctorId,isDoctorRecommended,doctorRemarks,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when car.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from activity.dbo.CENTRE_ACTIVITY aca join activity.dbo.ACTIVITY aa on aca.activityId=aa.id where aa.title =a.ActivityTitle and aa.description = a.ActivityDesc),
(select id from patient.dbo.PATIENT where nric=p.Nric),(select id from [user].dbo.TABLE_USER where userName=anu.UserName and email=anu.Email),
(CASE when car.DoctorRecommendation = 0 THEN 'Y' ELSE 'N' END),car.DoctorRemarks,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from CentreActivityRecommendation car
join CentreActivity ca on ca.CentreActivityID=car.CentreActivityID
join Activity a on ca.ActivityID=a.ActivityID
join Patient p on car.[PatientID]=p.PatientID
join AspNetUsers anu on anu.Id = car.DoctorID

insert into activity.dbo.ACTIVITY_AVAILABILIY(active,activityId,startTime,endTime,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when aa.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from activity.dbo.ACTIVITY where title=a.ActivityTitle and description=a.ActivityDesc and startDate=a.StartDate and endDate=a.EndDate),
CONVERT(INT, REPLACE(CONVERT(VARCHAR(5),cast(aa.StartTime as time) ,108), ':','')),CONVERT(INT, REPLACE(CONVERT(VARCHAR(5),cast(aa.EndTime as time) ,108), ':','')),
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from ActivityAvailability aa
join Activity a on a.ActivityID=aa.ActivityID

insert into activity.dbo.ACTIVITY_EXCLUSION(active,activityId,exclusionRemarks,startDate,endDate,createdDate,modifiedDate,createdById,modifiedById)
select
(CASE when ae.IsDeleted = 0 THEN 'Y' ELSE 'N' END),(select id from activity.dbo.ACTIVITY where title=a.ActivityTitle and description=a.ActivityDesc and startDate=a.StartDate and endDate=a.EndDate),
ae.ExclusionRemarks,ae.StartDateTime,ae.EndDateTime,
GETDATE(),GETDATE(),(select id from [user].dbo.table_user where firstname='system' ),(select id from [user].dbo.table_user where firstname='system' )
from ActivityExclusion ae
join Activity a on ae.ActivityExclusionID=a.ActivityID