use graphql
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
			  ,[BccEmailAddress]
			  ,[TsdEmailAddress]
			  ,[CreatorId]
			  ,[DateCreated]
			  ,[ModifierId]
			  ,[DateModified]
			  ,[DefaultZoneId]
			  ,[LocalBranchId]
			  ,[AppLanguageCode]
			  ,[AppLocaleCode]
			  ,[BadgeOffset]
			  ,[Signature]
			  ,[IsActive]
			  ,[BranchGuid]
			  ,[SyncHubPersonData]
			  ,[NewApplicationDate]
		  FROM BuilderAssistant_202003070816.[dbo].[Domain]
		  where @domainId is null or DomainId = @domainId
	end
	go

	grant execute on dbo.domains_sp to graphql
	go