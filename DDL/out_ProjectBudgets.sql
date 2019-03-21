drop table if exists out_ProjectBudgets CASCADE;
drop table if exists wrk_out_ProjectBudgets CASCADE;
drop table if exists wrk_out_ProjectBudgets_diff CASCADE;

CREATE TABLE out_ProjectBudgets
(
    TenantId varchar(255) encoding rle,
    PeriodAmount varchar(255),
    ProjectBudgetId varchar(255),
    ProjectId varchar(255),
    AccountId varchar(255),
    FiscalPeriodId varchar(255),
    ScenarioId varchar(255),
    _sys_is_deleted BOOLEAN encoding rle,
    _sys_hash varchar(32),
    _sys_updated_at timestamp
) ORDER BY ProjectBudgetId,
           TenantId,
           _sys_hash,
           _sys_is_deleted

SEGMENTED BY hash(TenantId,ProjectBudgetId) ALL NODES;

CREATE TABLE wrk_out_ProjectBudgets LIKE out_ProjectBudgets INCLUDING PROJECTIONS;
CREATE TABLE wrk_out_ProjectBudgets_diff LIKE out_ProjectBudgets INCLUDING PROJECTIONS;