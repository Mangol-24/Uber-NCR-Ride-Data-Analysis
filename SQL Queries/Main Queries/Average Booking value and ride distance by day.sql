SELECT DAY,
	ROUND(AVG(Booking_Value), 2) AS avg_booking_value,
	ROUND(AVG(Ride_Distance), 2) AS avg_ride_distance
FROM uber_ncr_data
WHERE Booking_Status = 'Completed'
GROUP BY DAY
ORDER BY DAY;