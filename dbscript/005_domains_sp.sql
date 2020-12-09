use BuilderAssistant_202010311927
go

if exists(select 1 from sys.procedures where name = 'domains_sp')
	begin
		drop proc dbo.domains_sp
	end
	go

	create proc dbo.domains_sp
	(
		@domainId int = null
	)
	as
	begin
		SELECT [DomainId]
			  ,[Name]
			  ,[TsdEmailAddress]
			  ,[CreatorId]
			  ,[DateCreated]
			  ,[ModifierId]
			  ,[DateModified]
			  ,[DefaultZoneId]
			  ,[LocalBranchId]
			  ,[AppLanguageCode]
			  ,[AppLocaleCode]
			  ,[Signature]
			  ,[IsActive]
			  ,[BranchGuid]
			  ,[SyncHubPersonData]
			  ,[NewApplicationDate]
		  FROM [dbo].[Domain]
		  where @domainId is null or DomainId = @domainId
	end
	go

	grant execute on dbo.domains_sp to [ba_server]
	go