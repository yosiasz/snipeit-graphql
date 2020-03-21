use graphql
go

if OBJECT_ID('vwCongregations') IS NOT NULL
	drop view vwCongregations;
	go

create view dbo.vwCongregations
as
SELECT [CongregationId]
      ,[Number]
      ,c.[Name] as congregationName
      ,c.[SyncKey]
      ,c.[FacilityId]
      ,c.[ContentId]
      ,[IsDissolved]
      ,c.[DomainId]
      ,[CongregationGuid]
	  ,d.Name as domainName
  from BuilderAssistant_202003070816.dbo.Congregation c
  left join BuilderAssistant_202003070816.dbo.Facility f on c.FacilityId = c.FacilityId
  left join BuilderAssistant_202003070816.dbo.Domain d on c.DomainId = d.DomainId
