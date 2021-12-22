
    
    

select
    _airbyte_ab_id as unique_field,
    count(*) as n_records

from "postgres"."raw"."_airbyte_raw_prod_invoices"
where _airbyte_ab_id is not null
group by _airbyte_ab_id
having count(*) > 1


