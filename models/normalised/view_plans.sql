{% set plan_type %}
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
{% endset %}


select 
    jsn.*

from 
    {{source ('prod_analytics', '_airbyte_raw_ourpath_prod_plans')}} p,
    jsonb_to_record(p._airbyte_data) jsn({{ plan_type }})
