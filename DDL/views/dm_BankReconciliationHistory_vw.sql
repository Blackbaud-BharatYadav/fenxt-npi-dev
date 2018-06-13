 create or replace view dm_BankReconciliationHistory as select 
_sys_transform_id,
TenantId,
BankReconciliationId,
BankId,
ReconciliationDate,
ReconciliationBalance,
AddedByUserId,
AddedByUserName
from out_BankReconciliationHistory 
 where _sys_transform_id = (select max(id) from _sys_transform_id where ts_end is not null and entity = 'dm_BankReconciliationHistory');
