SELECT Vehicle_Type, Booking_Status,
	COUNT(Booking_ID) AS total_rides
FROM ncr_ride_data
GROUP BY Vehicle_Type,Booking_Status
ORDER BY Vehicle_Type,Booking_Status;
