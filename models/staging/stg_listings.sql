select
  host_id,
  id as listing_id,
  review_scores_value,
  review_scores_location,
  review_scores_communication,
  review_scores_checkin,
  review_scores_cleanliness,
  review_scores_accuracy,
  review_scores_rating,
  number_of_reviews,
  availability_365,
  availability_90,
  availability_60,
  availability_30,
  maximum_nights,
  minimum_nights,
  accommodates,
  longitude,
  latitude,
  case when require_guest_phone_verification='f' then FALSE
  	   when require_guest_phone_verification='t' then TRUE
  	   else NULL end as require_guest_phone_verification,
  case when require_guest_profile_picture='f' then FALSE
  	   when require_guest_profile_picture='t' then TRUE
  	   else NULL end as require_guest_profile_picture,
  nullif(cancellation_policy,'') as cancellation_policy,
  case when is_business_travel_ready='f' then FALSE
  	   when is_business_travel_ready='t' then TRUE
  	   else NULL end as is_business_travel_ready,
  case when instant_bookable='f' then FALSE
  	   when instant_bookable='t' then TRUE
  	   else NULL end as instant_bookable,
  nullif(jurisdiction_names,'') as jurisdiction_names,
  nullif(license,'') as license,
  case when requires_license='f' then FALSE
  	   when requires_license='t' then TRUE
  	   else NULL end as requires_license,
  case when has_availability='f' then FALSE
  	   when has_availability='t' then TRUE
  	   else NULL end as has_availability,
  nullif(calendar_updated,'') as calendar_updated,
  nullif(replace(split_part(extra_people, '$', 2), ',', ''), '')::float as extra_people_fee,
  nullif(guests_included,'') as guests_included,
  nullif(replace(split_part(cleaning_fee, '$', 2), ',', ''), '')::float as cleaning_fee,
  nullif(replace(split_part(security_deposit, '$', 2), ',', ''), '')::float as security_deposit,
  nullif(replace(split_part(monthly_price, '$', 2), ',', ''), '')::float as monthly_price,
  nullif(replace(split_part(weekly_price, '$', 2), ',', ''), '')::float as weekly_price,
  nullif(replace(split_part(price, '$', 2), ',', ''), '')::float as price,
  nullif(square_feet,'') as square_feet,
  nullif(amenities,'') as amenities,
  nullif(bed_type,'') as bed_type,
  nullif(beds,'') as beds,
  nullif(bedrooms,'') as bedrooms,
  nullif(bathrooms,'') as bathrooms,
  nullif(room_type,'') as room_type,
  nullif(property_type,'') as property_type,
  case when is_location_exact='f' then FALSE
  	   when is_location_exact='t' then TRUE
  	   else NULL end as is_location_exact,
  nullif(country,'') as country,
  nullif(country_code,'') as country_code,
  nullif(smart_location,'') as smart_location,
  nullif(market,'') as market,
  nullif(zipcode,'') as zipcode,
  nullif(state,'') as state,
  nullif(city,'') as city,
  nullif(neighbourhood_group_cleansed,'') as neighbourhood_group_cleansed,
  nullif(neighbourhood_cleansed,'') as neighbourhood_cleansed,
  nullif(neighbourhood,'') as neighbourhood,
  nullif(street,'') as street,
  case when host_identity_verified='f' then FALSE
  	   when host_identity_verified='t' then TRUE
  	   else NULL end as host_identity_verified,
  case when host_has_profile_pic='f' then FALSE
  	   when host_has_profile_pic='t' then TRUE
  	   else NULL end as host_has_profile_pic,
  nullif(host_verifications,'') as host_verifications,
  nullif(host_neighbourhood,'') as host_neighbourhood,
--  host_picture_url,
--  host_thumbnail_url,
  case when is_superhost='f' then FALSE
  	   when is_superhost='t' then TRUE
  	   else NULL end as is_superhost,
  split_part(nullif(nullif(acceptance_rate,'N/A'),''),'%',1)::FLOAT/100 as acceptance_rate,
  split_part(nullif(nullif(response_rate,'N/A'),''),'%',1)::FLOAT/100 as response_rate,
  nullif(nullif(response_time,'N/A'),'') as response_time,
  nullif(host_about,'') as host_about,
  nullif(host_location,'') as host_location,
  nullif(host_name,'') as host_name,
--  host_url,
--  xl_picture_url,
--  picture_url,
--  medium_url,
--  thumbnail_url,
  nullif(house_rules,'') as house_rules,
  nullif(interaction,'') as interaction,
  nullif(access,'') as access,
  nullif(transit,'') as transit,
  nullif(notes,'') as notes,
  nullif(neighborhood_overview,'') as neighborhood_overview,
  nullif(experiences_offered,'') as experiences_offered,
  nullif(description,'') as description,
  nullif(space,'') as space,
  nullif(summary,'') as summary,
  nullif(name,'') as name,
  to_timestamp(scrape,'YYYYMMDDHH24MISS') as scrape,
--scrape,
--  url,
  last_review::DATE as last_review_date,
  first_review::DATE as first_review_date,
--  calendar_last_scraped,
  host_since::DATE as host_since_date
--  ,  last_scraped
from
  source_data.listings
