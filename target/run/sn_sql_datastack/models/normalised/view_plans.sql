
  create view "postgres"."analytics_normalised"."view_plans__dbt_tmp" as (
    


select 
    jsn.*

from 
    "postgres"."analytics_raw"."_airbyte_raw_ourpath_prod_plans" p,
    jsonb_to_record(p._airbyte_data) jsn(
    "_id" text, 
    "name" text, 
    "amount" float, 
    "product" text, 
    "currency" text, 
    "interval" text, 
    "isActive" boolean, 
    "isDefault" boolean, 
    "intervalCount" float, 
    "planLengthWeeks" float, 
    "trialPeriodDays" float, 
    "countryCodes" json
)
  );