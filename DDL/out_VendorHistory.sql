drop table if exists out_VendorHistory;
CREATE TABLE out_VendorHistory
(
    _sys_transform_id int NOT NULL encoding rle,
    TenantId varchar(255) encoding rle,
    VendorHistoryId varchar(255),
    VendorId varchar(255),
    FieldChanged varchar(255),
    FieldChangedTranslation varchar(255),
    OldValue varchar(255),
    NewValue varchar(255),
    DateChanged varchar(255),
    ChangedByUserName varchar(255)
)  ORDER BY TenantId,
          _sys_transform_id
SEGMENTED BY hash(TenantId) ALL NODES
PARTITION BY (_sys_transform_id);