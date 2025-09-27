SELECT Payment_Method, COUNT(*) AS total_rides,
       ROUND( (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM uber_ncr_data)), 2) AS percentage_share
FROM uber_ncr_data
GROUP BY Payment_Method
ORDER BY total_rides DESC;
