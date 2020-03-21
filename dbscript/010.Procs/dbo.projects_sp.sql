use graphql
go

if exists(select 1 from sys.procedures where name = 'projects_sp')
	begin
		drop proc dbo.projects_sp
	end
	go

	create proc dbo.projects_sp
	(
		@projectId int = null
	)
	as
	begin
		SELECT [ProjectId]
		  ,[ProjectNumber]
		  ,p.[Name]
		  ,[Description]		  
		  ,[CongregationId]
		  ,[ZoneId]
		  ,[ProjectTypeCode]
		  ,[ProjectFacilityCode]
		  ,[ProjectCategoryCode]
		  ,[ProjectStatusNote]
		  --,[EstimatedStartDate]
		  ,[ActualStartDate]
		  ,[PermitDate]
		  --,[EstimatedServiceYearCompletion]
		  ,[ActualCompletionDate]
		  ,[TimeZone]
		  ,[DisplayLocation]
		  ,[SyncKey]
		  ,[ContentId]

		  ,[IsTasksOrdered]
		  ,[SecurityPolicyId]
		  ,[ProjectGuid]
		  ,[AddressLines]
		  ,[CountryCode]
		  ,[GeoCoordinates]
		  ,[HubPropertyLocationGuid]
		  ,[HubWhqPropertyLocationNumber]
		  ,[ProjectStatusCode]
		  ,[IsHubSourced]
		  ,[HubLdcEntityPrimaryGuid]
		  ,[HubLdcEntitySecondaryGuid]
		  ,DomainId
	 FROM BuilderAssistant_202003070816.[dbo].[project] p
	 where @projectId is null or ProjectId = @projectId

	end
	go

	grant execute on dbo.projects_sp to graphql
	go