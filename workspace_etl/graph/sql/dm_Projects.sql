select
 "ProjectId",
 "UserId",
 GoodData_Attr('{"state":"ledger.project.detail","id":'||ProjectId||'}') as "UserIdHyperlink",
 ProjectId as "DescriptionId",
 Description as "DescriptionLabel",
 "Division",
 "Location",
 "Department",
 "DateAdded",
 "DateChanged",
 "AddedByUserName",
 "AddedByUserNameLabel",
 "ProjectType",
 "ProjectDateId",
 "ProjectStatus",
 "Dummy"
from dm_Projects
where TenantId = '${TenantId}'

--union all
--select  
--GoodData_Attr(-1) as "ProjectId" ,
--GoodData_Attr('<No Project>') as "UserId" ,
--GoodData_Attr('{"state":"","id":0}') as "UserIdHyperlink",
-- GoodData_Attr(-1) as "DescriptionId",
-- GoodData_Attr('<No Project>') as "DescriptionLabel",
--GoodData_Attr('No Division') as "Division" ,
--GoodData_Attr('No Location') as "Location" ,
--GoodData_Attr('No Department') as "Department",
--null as "DateAdded" ,
--null as "DateChanged",
--GoodData_Attr('') as "AddedByUserName",
--GoodData_Attr('') as "AddedByUserNameLabel",
--GoodData_Attr('No Type') as "ProjectType",
--GoodData_Attr(0) as "ProjectDateId",
--GoodData_Attr('Active') as "ProjectStatus",
--GoodData_Attr(1) as "Dummy"
union all
select	
GoodData_Attr(-2) as "ProjectId" ,
GoodData_Attr('') as "UserId" ,
GoodData_Attr('') as "UserIdHyperlink",
 GoodData_Attr(-2) as "DescriptionId",
 GoodData_Attr('') as "DescriptionLabel",
GoodData_Attr('') as "Division" ,
GoodData_Attr('') as "Location" ,
GoodData_Attr('') as "Department",
null as "DateAdded" ,
null as "DateChanged",
GoodData_Attr('') as "AddedByUserName",
GoodData_Attr('') as "AddedByUserNameLabel",
GoodData_Attr('') as "ProjectType",
GoodData_Attr(0) as "ProjectDateId",
GoodData_Attr('Active') as "ProjectStatus",
GoodData_Attr(1) as "Dummy"
;