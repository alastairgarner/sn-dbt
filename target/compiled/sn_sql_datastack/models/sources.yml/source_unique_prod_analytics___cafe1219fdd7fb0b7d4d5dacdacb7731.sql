
    
    

select
    _airbyte_emitted_at as unique_field,
    count(*) as n_records

from "postgres"."raw"."_airbyte_raw_prod_plans"
where _airbyte_emitted_at is not null
group by _airbyte_emitted_at
having count(*) > 1


