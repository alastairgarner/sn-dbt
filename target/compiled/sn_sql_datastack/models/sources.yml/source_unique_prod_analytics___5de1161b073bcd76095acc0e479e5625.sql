
    
    

select
    _airbyte_ab_id as unique_field,
    count(*) as n_records

from "postgres"."analytics_raw"."_airbyte_raw_ourpath_prod_plans"
where _airbyte_ab_id is not null
group by _airbyte_ab_id
having count(*) > 1


