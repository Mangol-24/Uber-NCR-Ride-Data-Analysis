SELECT Vehicle_Type,
	ROUND(AVG(Ride_Distance), 2) AS avg_ride_distance,
	ROUND(AVG(Booking_Value), 2) AS avg_booking_value
FROM ncr_ride_data
WHERE Booking_Status = 'Completed'
GROUP BY Vehicle_Type
ORDER BY avg_booking_value DESC;