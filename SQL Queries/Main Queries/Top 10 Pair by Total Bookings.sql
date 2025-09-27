SELECT Pickup_Location, Drop_Location,
	COUNT(Booking_ID) AS total_bookings
FROM uber_ncr_data
GROUP BY Pickup_Location,Drop_Location
ORDER BY total_bookings DESC
LIMIT 10;
