with listings as (

  select * from {{ ref('stg_listings') }}

)

select distinct
	host_id,
	host_name,
	host_since_date,
	host_about,
	host_location,
	host_neighbourhood,
	host_identity_verified,
	host_has_profile_pic,
	host_verifications,
	is_superhost,
	count(listing_id) over (partition by host_id) as number_of_listings,
	avg(review_scores_value) over (partition by host_id) as avg_review_scores_value,
	avg(review_scores_location) over (partition by host_id) as review_scores_location,
	avg(review_scores_communication) over (partition by host_id) as review_scores_communication,
	avg(review_scores_checkin) over (partition by host_id) as review_scores_checkin,
	avg(review_scores_cleanliness) over (partition by host_id) as review_scores_cleanliness,
	avg(review_scores_accuracy) over (partition by host_id) as review_scores_accuracy,
	avg(review_scores_rating) over (partition by host_id) as review_scores_rating,
	sum(number_of_reviews) over (partition by host_id) as number_of_reviews
from
	listings
