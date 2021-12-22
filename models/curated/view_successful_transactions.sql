select 
    txn.*
    , sum(txn."amount_transaction") over (
                partition by txn."user_id" 
                order by txn."date_transaction"
            ) as amount_cum_user_transaction

from 
	{{ ref("view_transactions") }} txn

where
    txn.success = true
    and txn.status in ('settled', 'refunded')
