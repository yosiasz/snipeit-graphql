

alter view dbo.vw_ActionSummaries
as

/*
https://www.mathsisfun.com/binary-decimal-hexadecimal-converter.html
*/
		
select 'Volunteer_Personal_Name_Modified' as SummaryText, '1' as Summary union
select 'Volunteer_Personal_BirthDate_Modified', '2' union
select 'Volunteer_Spiritual_BaptismDate_Modified', '4' union
select 'Volunteer_Personal_EmailAddress_Modified', '8' union
select 'Volunteer_Personal_Address_Modified', '16' union
select 'Volunteer_Personal_Marital_Modified', '32' union
select 'Volunteer_Spiritual_CongregationID_Modified', '64' union
select 'Volunteer_Spiritual_ServingAs_Modified', '256' union
select 'Volunteer_Service_WillingToAssist_Modified', '512' union
select 'Volunteer_Personal_PhoneNumber_Home_Modified', '1024' union
select 'Volunteer_Personal_PhoneNumber_Work_Modified', '2048' union
select 'Volunteer_Personal_PhoneNumber_Mobile_Modified', '4096' union
select 'Volunteer_Personal_PhoneNumber_Fax_Modified', '8192' union
select 'Volunteer_Personal_PhoneNumber_Other_Modified', '16384' union
select 'Volunteer_Personal_PrimaryPhoneId_Modified', '32768' union
select 'Volunteer_FormsOfService_Approval_Modified', '65536' union
select 'Volunteer_Admin_Password_Changed', '131072' union
select 'Volunteer_Admin_Password_Reset', '262144' union
select 'Volunteer_Admin_Account_Suspended_Modified', '524288' union
select 'Volunteer_Skills_Volunteer_Assessed', '1048576' union
select 'Volunteer_Admin_Unlink_JwOrg_Account', '2097152' union
select 'Volunteer_Admin_Change_JwOrg_Account', '4194304' union
select 'Volunteer_DC50_Approval_Modified', '8388608' union
select 'Volunteer_A19_Approval_Modified', '16777216' union
select 'Volunteer_Security_AddedTo_Domain', '33554432' union
select 'Volunteer_Security_RemovedFrom_Domain', '67108864' union
select 'Volunteer_Security_Permissions_Changed', '134217728' union
select 'Volunteer_Admin_Added_JwOrg_Account', '268435456' union
select 'Volunteer_Personal_Volunteer_Created', '536870912' union
select ' Volunteer_Person_HuBSource_Update', '1073741824' union
select 'Volunteer_Welcome_Notification_Sent', '2147483648' union 
select 'Volunteer_HasEligibleDC50','4294967296' union
select 'Volunteer_HasEligibleA19','8589934592' union
select 'Volunteer_HasEligibleEnrollment','17179869184' union
select 'Volunteer_HasEligibleRole','34359738368' union
select 'Volunteer_ApprovedManually','68719476736' union
select 'Volunteer_UnapprovedAsDuplicate','137438953472' union
select 'Volunteer_UnapprovedAsRoleConcluded','274877906944' union
select 'Volunteer_UnapprovedAsOther','549755813888' union
select 'Volunteer_UnapprovedAsPendingVerification','1099511627776' union
select 'Volunteer_Admin_Account_Suspended_Approved','2199023255552' union
select 'Volunteer_Admin_Account_Suspended_Unapproved',' 4398046511104' 