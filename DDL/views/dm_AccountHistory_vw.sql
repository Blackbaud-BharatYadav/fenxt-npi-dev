 create or replace view dm_AccountHistory as select 
_sys_transform_id,
TenantId,
AccountHistoryId,
AccountId,
FieldChanged,
FieldChangedTranslation,
OldValue,
NewValue,
DateChanged,
ChangedByUserName
from out_AccountHistory 
 where _sys_transform_id = (select max(id) from _sys_transform_id where ts_end is not null and entity = 'dm_AccountHistory');
