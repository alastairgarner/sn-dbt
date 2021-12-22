
    
    

select
    _airbyte_emitted_at as unique_field,
    count(*) as n_records

from "postgres"."analytics_raw"."_airbyte_raw_ourpath_prod_invoices"
where _airbyte_emitted_at is not null
group by _airbyte_emitted_at
having count(*) > 1


