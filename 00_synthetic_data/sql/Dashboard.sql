Data_range selection filter parameter
SELECT * FROM ws_dbxproject_catalog.`01_bronze`.customers
where join_date BETWEEN :DATE_RANGE.min and :DATE_RANGE.max


SELECT item_name,
    sum(quantity) as total_qty_sold
FROM ws_dbxproject_catalog.`02_silver`.fact_order_items
where order_date BETWEEN :DATE_RANGE.min and :DATE_RANGE.max
GROUP by item_name
ORDER BY total_qty_sold DESC
LIMIT 10


Positive negative review over time
SELECT r.name as restaurant_name,
    date(review_timestamp) as review_date,
    count(distinct case when sentiment = 'positive' then order_id else null end) positive_review_count,
    count(distinct case when sentiment = 'negative' then order_id else null end) negative_review_count,
    count(distinct case when sentiment = 'neutral' then order_id else null end) neutral_review_count
FROM ws_dbxproject_catalog.`02_silver`.fact_reviews fr
join ws_dbxproject_catalog.`01_bronze`.restaurants r 
ON fr.restaurant_id = r.restaurant_id
group by 1, 2
ORDER BY 1, 2


SELECT r.name as restaurant_name,
    count(distinct case when fr.issue_delivery = 'true' then order_id else null end) as count_issues_delivery,
    count(distinct case when fr.issue_food_quality = 'true' then order_id else null end) as count_issues_food_quality,
    count(distinct case when fr.issue_pricing = 'true' then order_id else null end) as count_issues_pricing,
    count(distinct case when fr.issue_portion_size = 'true' then order_id else null end) as count_issues_portion_size
FROM ws_dbxproject_catalog.`02_silver`.fact_reviews fr
JOIN ws_dbxproject_catalog.`01_bronze`.restaurants r ON fr.restaurant_id = r.restaurant_id
group by 1