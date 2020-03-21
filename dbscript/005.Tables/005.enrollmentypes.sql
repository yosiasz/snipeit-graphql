use BAbi
go

if OBJECT_ID('enrollmenttypes') IS NOT NULL
	drop table enrollmenttypes;

create table enrollmenttypes(enrollmentypeid int identity(1,1),
enrollmentypecode nvarchar(50),
enrollmentypename nvarchar(50),
enrollmenttypeDesc nvarchar(50)
)


insert into enrollmenttypes(enrollmentypecode, enrollmentypename, enrollmenttypeDesc)
select 'SFTS', 'Special Full Time Service', null union
select 'Commuter', null, null union
select null, 'Remote', null union
select 'Temporary', null, null

select * from enrollmenttypes
/*



	select BAS, BCF, BCL, BCS, BSS			
	BBO, BCC, BCL					Commuter
	Remote
	BBO, BCV						Temporary

*/