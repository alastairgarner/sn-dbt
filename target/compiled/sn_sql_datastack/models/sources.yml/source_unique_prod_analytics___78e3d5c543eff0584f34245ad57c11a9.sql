
    
    

select
    _airbyte_data as unique_field,
    count(*) as n_records

from "postgres"."raw"."_airbyte_raw_prod_viewusers"
where _airbyte_data is not null
group by _airbyte_data
having count(*) > 1


