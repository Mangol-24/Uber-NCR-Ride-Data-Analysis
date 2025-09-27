SELECT  Drop_Location,
	COUNT(*) AS total_rides 
FROM uber_ncr_data
GROUP BY Drop_Location
ORDER BY total_rides DESC 
LIMIT 10;