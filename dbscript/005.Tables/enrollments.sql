----insert into PersonSyncCandidate(PersonGuid, DateModified, ProcessingStatus)
--select  ua.PersonGuid, getdate(), 0 ,HubIsCommuter, HubIsRemote, HubIsSpecialService, HubIsTemporary
--  from Person p
--  join Volunteer v on p.PersonId = v.PersonId
--  join UserAccount ua on ua.VolunteerId = v.VolunteerId
--  join VolunteerAssignment va on va.VolunteerId = v.VolunteerId
--  where PersonGuid = N'b353fb69-1332-4c35-a196-c575169066a9'

/*
	More results for BCC, BCL and BBO than for type Commuter

	BAS, BCF, BCL, BCS, BSS	SFTS
	BBO, BCC, BCL			Commuter
							Remote
	BBO, BCV				Temporary

    case BAS: // Assembly Hall Servant
        return BranchAssignmentTypeCode.AssemblyHallServant;

    case BCS: // Construction Servant
        return BranchAssignmentTypeCode.BranchConstructionServant;

    case BCL: // Full-Time Construction Commuter
        return BranchAssignmentTypeCode.FullTimeConstructionCommuter;

    case BSS: // Bible School Facility Servant
        return BranchAssignmentTypeCode.BibleSchoolServant;

    case BCF: // Expatriate Construction Servant
        return BranchAssignmentTypeCode.ExpatriateConstructionServant;

    case BBO: // Occasional Commuter. Not used for eligibility
        return BranchAssignmentTypeCode.OccasionalCommuter;

    default:
        return BranchAssignmentTypeCode.none;

*/

select v.VolunteerNumber, v.VolunteerId, ua.PersonGuid, HubIsCommuter, HubIsRemote, HubIsSpecialService, HubIsTemporary, BranchAssignmentTypeCode
  from Person p
  join Volunteer v on p.PersonId = v.PersonId
  join UserAccount ua on ua.VolunteerId = v.VolunteerId
  left join VolunteerAssignment va on va.VolunteerId = v.VolunteerId
  
  where HubIsCommuter = 0 
    and BranchAssignmentTypeCode  in (5,9,10,11)


select v.VolunteerNumber, v.VolunteerId, ua.PersonGuid, HubIsCommuter, HubIsRemote, HubIsSpecialService, HubIsTemporary, BranchAssignmentTypeCode
  from Person p
  join Volunteer v on p.PersonId = v.PersonId
  join UserAccount ua on ua.VolunteerId = v.VolunteerId
  left join VolunteerAssignment va on va.VolunteerId = v.VolunteerId
  
  where HubIsCommuter = 1 
    and BranchAssignmentTypeCode not in (5,9,10,11)

--select v.VolunteerNumber, v.VolunteerId, ua.PersonGuid, HubIsCommuter, HubIsRemote, HubIsSpecialService, HubIsTemporary, BranchAssignmentTypeCode
--  from Person p
--  join Volunteer v on p.PersonId = v.PersonId
--  join UserAccount ua on ua.VolunteerId = v.VolunteerId
--  left join VolunteerAssignment va on va.VolunteerId = v.VolunteerId
  
--  where HubIsCommuter = 1 or HubIsRemote = 1 or HubIsSpecialService = 1 or HubIsTemporary = 1 
  
  --select * from PersonSyncCandidate --where PersonGuid = N'b353fb69-1332-4c35-a196-c575169066a9'
