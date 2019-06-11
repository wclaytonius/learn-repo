select
  listing_id::BIGINT as listing_id,
  nullif(replace(split_part(price, '$', 2), ',', ''), '')::float as price,
  case when available='f' then FALSE
  	   when available='t' then TRUE
  	   else NULL end as available,
  date
from
  source_data.listing_history
