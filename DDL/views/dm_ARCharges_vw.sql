 create or replace view dm_ARCharges as select 
_sys_transform_id,
TenantId,
ARChargeId,
ARChargeType,
ARChargeInvoiceId,
ARChargeLineItemSequence,
ARChargePostStatus,
ARChargePaymentStatus,
ARChargeItemDescription,
ARChargeAmount,
ARChargeBalance,
ARClientId,
GoodData_Date(datechanged::date) datechanged,
GoodData_Date(dateadded::date) dateadded,
GoodData_Date(postdate::date) postdate,
GoodData_Date(duedate::date) duedate
from out_ARCharges 
 where _sys_transform_id = (select max(id) from _sys_transform_id where ts_end is not null and entity = 'dm_ARCharges');
