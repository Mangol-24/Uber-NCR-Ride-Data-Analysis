SELECT Customer_ID,
	SUM(Booking_Value) AS total_spending
FROM uber_ncr_data
GROUP BY Customer_ID 
ORDER BY total_spending DESC 
LIMIT 10;