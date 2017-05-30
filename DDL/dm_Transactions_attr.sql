 create or replace view dm_Transactions_attr as select 
_sys_transform_id,
TenantId,
PostStatusTranslation,
PostDate,
TransactionTypeTranslation,
EncumbranceStatusTranslation,
TransactionCode1,
TransactionCode1IsActive,
TransactionCode2,
TransactionCode2IsActive,
TransactionCode3,
TransactionCode3IsActive,
TransactionCode4,
TransactionCode4IsActive,
TransactionCode5,
TransactionCode5IsActive,
DateAdded,
DateChanged,
TransactionAttrDistributionId,
TransactionId,
AddedByUserNameId,
AddedByUserName,
LastChangedByUserName,
Class,
TransactionAttributeId,
IsBeginningBalance
from out_Transactions_attr 
 where _sys_transform_id = (select max(id) from _sys_transform_id where ts_end is not null and entity = 'dm_Transactions_attr');
