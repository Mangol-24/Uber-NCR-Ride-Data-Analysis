SELECT Pickup_Location,
	COUNT(*) AS total_rides
FROM uber_ncr_data
GROUP BY Pickup_Location
ORDER BY total_rides DESC
LIMIT 10;
