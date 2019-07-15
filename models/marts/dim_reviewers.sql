with reviews as (

  select * from {{ ref('stg_reviews') }}

),

listings as (

  select * from {{ ref('stg_listings') }}

)

select
	reviewer_name,
	min(reviews.date) as first_review_date,
	max(reviews.date) as last_review_date,
	count(reviews.id) as total_reviews,
	listagg(distinct listings.neighbourhood, ', ') WITHIN GROUP (ORDER BY listings.neighbourhood) as neighbourhoods_visited_list
from
	reviews left join listings using (listing_id)
group by 1
