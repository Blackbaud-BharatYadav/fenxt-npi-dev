
select
 "BankId",
 "DateAdded",
 "DateChanged",
 "AddedByUserName",
 "AddedByUserNameLabel",
 "ChangedByUserNameLabel",
 "BankDateId",
 "Dummy",
 "IsReconciled",
 "DateLastReconciled",
 "LastReconciledByUserName",
 "LastReconciledByUserNameLabel",
 "ReconciledBalance",
 "Name",
 "AccountId",
 Bankid as "Descriptionid",
 Description as "DescriptionLabel",
 "AccountNumber",
 "RoutingNumber",
 "AccountType",
 "AccountTypeTranslation"
from dm_Banks
where TenantId = '${TenantId}'
union all
select  
GoodData_Attr(-1) as "BankId",
null as "DateAdded",
null as "DateChanged",
GoodData_Attr(0) as "AddedByUserName",
GoodData_Attr('') as "AddedByUserNameLabel",
GoodData_Attr('') as "ChangedByUserNameLabel",
GoodData_Attr(0) as "BankDateId",
GoodData_Attr(1) as "Dummy",
'false' as "IsReconciled",
null as "DateLastReconciled",
GoodData_Attr(null) as "LastReconciledByUserName",
GoodData_Attr('') as "LastReconciledByUserNameLabel",
null as "ReconciledBalance",
GoodData_Attr('<No Bank>') as "Name",
GoodData_Attr('<No Bank>') as "AccountId",
 GoodData_Attr(-1) as "Descriptionid",
 GoodData_Attr('<No Bank>') as "DescriptionLabel",
GoodData_Attr('<No Bank>') as "AccountNumber",
GoodData_Attr('<No Bank>') as "RoutingNumber",
GoodData_Attr(1) as "AccountType",
GoodData_Attr('Checking') as "AccountTypeTranslation"
;