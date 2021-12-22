
  create view "postgres"."normalised"."viewplans__dbt_tmp" as (
    select 
    jsn.*

from 
    "postgres"."raw"."_airbyte_raw_prod_viewusers" p,
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