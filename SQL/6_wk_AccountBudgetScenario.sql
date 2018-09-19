truncate table wk_AccountBudgetScenario;
insert /*+ direct*/ into wk_AccountBudgetScenario
select 
   ab.TenantId
  ,ab.AccountId
  ,ab.AccountBudgetId
  ,te.CodeTableId
  --,te.Description as "ScenarioId"
  ,isnull(to_char(BS.ScenarioId), '<No budget>') as "ScenarioId"
from stg_csv_AccountBudget_merge ab
join stg_csv_BudgetScenario_merge bs
	on ab.BudgetScenarioId = bs.BudgetScenarioId and ab.TenantId = bs.TenantId
join stg_csv_TableEntry_merge te
	on bs.ScenarioId = te.TableEntryId and ab.TenantId = te.TenantId and te._sys_is_deleted = false
;
select analyze_statistics('wk_AccountBudgetScenario');


truncate table tmp_ProjectBudgets;
insert /*+direct*/ into tmp_ProjectBudgets
select   pb.TenantId as "TenantId"
	,pb.ProjectBudgetId
	,abd.AccountBudgetDetailId as "AccountBudgetAttrId"
	,pb.ProjectId  as "ProjectId"
	,pb.AccountId  as "AccountId"
	,pb.Amount as "ProjectBudgetAmount"
	,abs.ScenarioId as "ScenarioId"
from stg_csv_ProjectBudget_merge pb
join stg_csv_AccountBudgetDetail_merge abd
	on pb.AccountBudgetId = abd.AccountBudgetId and pb.TenantId = abd.TenantId
join wk_AccountBudgetScenario abs
	on pb.AccountBudgetId = abs.AccountBudgetId and pb.TenantId = abs.TenantId
;

select analyze_statistics('tmp_ProjectBudgets');