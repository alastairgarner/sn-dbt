

select
	vs.*
from
 	"postgres"."analytics_raw"."_airbyte_raw_ourpath_prod_subscriptions" s,
	jsonb_to_record(s._airbyte_data) as vs(
    "_id" varchar(24),
    "user" varchar(24),
    "plan" text,
    "dateFrom" timestamptz,
    "dateTo" timestamptz,
    "dateAdded" timestamptz,
    "dateBilledTo" timestamptz,
    "dateToCancel" timestamptz,
    "dateCancelled" timestamptz,
    "dateRestarted" timestamptz,
    "dateSubscriptionMovedTo" timestamptz,
    "daysToDelayPayment" int,
    "notes" text,
    "isActive" bool,
    "fromMigration" bool,
    "isMigratedFromOngoing" bool,
    "__v" int,
    "promoCode" varchar(24),
    "subscriptionMovedFrom" varchar(24),
    "subscriptionMovedTo" varchar(24),
    "reasonCancelled" text,
    "status" text,
    "addOns" jsonb
)