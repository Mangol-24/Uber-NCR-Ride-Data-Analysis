SELECT DAY,
	COUNT(Booking_id) AS total_bookings
FROM uber_ncr_data
GROUP BY DAY
ORDER BY total_bookings DESC;


