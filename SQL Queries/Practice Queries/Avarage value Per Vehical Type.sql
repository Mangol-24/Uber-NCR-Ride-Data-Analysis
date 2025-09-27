SELECT Vehicle_Type,
	ROUND(AVG(Booking_Value / NULLIF (Ride_distance, 0)), 2) AS avg_value_per_km
FROM uber_ncr_data
WHERE Ride_distance > 0
GROUP BY Vehicle_Type
ORDER BY avg_value_per_km DESC;