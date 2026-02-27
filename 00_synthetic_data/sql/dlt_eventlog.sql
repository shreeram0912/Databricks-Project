
-- Delta Live Tables (DLT) event logs with JSON field access syntax: Understanding execution plans, Debugging optimization behavior, Checking lineage & dependency resolution
select
  timestamp,
  details:flow_definition.output_dataset,
  details:flow_progress.status,
  details:planning_information
from event_log(table(`03_gold`.d_customer_360))
where details:planning_information is not null
order by timestamp desc
limit 10;
