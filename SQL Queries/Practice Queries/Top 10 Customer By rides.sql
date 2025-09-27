SELECT Customer_ID,
	COUNT(Booking_ID) AS total_rides
FROM uber_ncr_data
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 10;