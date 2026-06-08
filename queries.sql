-- Total Revenue

SELECT
  ROUND(SUM(sale_price), 2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete';


-- Order Status Distribution

SELECT
  status,
  COUNT(*) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY status
ORDER BY total_orders DESC;


-- Monthly Revenue Trend

SELECT
  FORMAT_DATE('%Y-%m', DATE(created_at)) AS month,
  ROUND(SUM(sale_price), 2) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete'
GROUP BY month
ORDER BY month;
