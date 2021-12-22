






with transactions as (
	select 
		jsn._airbyte_emitted_at,
		inv.*,
		trn.*,
		chg as "charge"

	from 
		"postgres"."analytics_raw"."_airbyte_raw_ourpath_prod_invoices" jsn,
		jsonb_to_record(jsn._airbyte_data) as inv(
    "_id" varchar(24),
    "accountCreditUsed" numeric,
    "addOnAmount" numeric,
    "addOns" text,
    "amount" numeric,
    "chargeHistory" jsonb,
    "currency" text,
    "dateAdded" timestamptz,
    "discountAmount" numeric,
    "emailReminderSent" boolean,
    "plan" text,
    "status" text,
    "statusTransitions" jsonb,
    "subscription" varchar(24),
    "user" varchar(24)
),
		jsonb_to_record(inv."statusTransitions") as trn(
    "refundedAt" timestamptz,
    "settledAt" timestamptz,
    "uncollectableAt" timestamptz,
    "voidAt" timestamptz
),
		jsonb_array_elements(inv."chargeHistory") chg

)

-- Sort of like a final "project" statement, defining which columns to carry through
-- and what they should be called
select 
	txn."_id" as invoice_id,
	txn."accountCreditUsed" as account_credit_used,
	txn."addOnAmount" as amount_add_on,
	txn."addOns" as add_ons,
	txn."amount" as amount_invoice,
	txn."currency" as currency,
	txn."dateAdded" as date_invoice,
	txn."discountAmount" as amount_discount,
	txn."plan" as plan,
	txn."status" as "status",
	txn."subscription" as subscription_id,
	txn."user" as "user_id",
	chg."amount" as amount_transaction,
	chg."braintreeChargeId" as braintree_charge_id,
	chg."dateAdded" as date_transaction,
	chg."errorMessage" as "error_message",
	chg."eventType" as event_type,
	chg."provider" as "provider",
	chg."success" as success,
	chg."stripeChargeId" as stripe_charge_id,
	chg."stripePaymentIntentId" as stripe_payment_intent_id,
	txn._airbyte_emitted_at

from transactions txn,
	-- Unpack the charge_history json 
	jsonb_to_record(txn."charge") as chg(
	"_id" varchar(24),
	"amount" numeric,
	"braintreeChargeId" text,
	"currency" text,
	"dateAdded" timestamptz,
	"emailReminderSent" boolean,
	"errorMessage" text,
	"eventType" text,
	"provider" text,
	"success" boolean,
	"stripeChargeId" text,
	"stripePaymentIntentId" text
)

order by date_transaction DESC