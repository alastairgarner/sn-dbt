
  create view "postgres"."analytics_normalised"."view_users__dbt_tmp" as (
    

select 
	u.*
from 
 	"postgres"."analytics_raw"."_airbyte_raw_ourpath_prod_viewusers" vu,
	jsonb_to_record(vu._airbyte_data) as u(
	"_id" text,
	"targetWeight" numeric,
	"startingWeight" numeric,
	"gender" varchar(1),
	"programmeActive" bool,
	"progressToGoal" numeric,
	"dateAdded" timestamptz,
	"countryCode" text,
	"isOnActiveSubscription" bool,
	"programmes" jsonb,
	"userType" text,
	"quizFlowAnswerMotivation" text,
	"quizFlowAnswerChallenge" text,
	"coreProgrammeType" text,
	"healthConditions" text,
	"BMI" numeric,
	"age" numeric,
	"height" numeric,
	"weight" numeric,
	"addressCity" text,
	"addressPostCode" text,
	"addressPostCodeArea" text,
	"addressState" text,
	"addressStateCode" text,
	"sustainProgrammeType" text,
	"latestStartDate" timestamptz,
	"dateAddedToGroup" timestamptz,
	"dateSubmittedTwelveweekNPS" timestamptz,
	"latestDateCancelled" timestamptz,
	"latestSustainStartDate" timestamptz,
	"previousGroups" jsonb,
	"promoCodeUser" text,
	"signUpDate" timestamptz,
	"twelveWeekNPS" numeric,
	"twelveWeekNPSReason" text,
	"twoWeekNPS" numeric,
	"twoWeekNPSReason" text
)
  );