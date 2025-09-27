SELECT
	EXTRACT(HOUR FROM TIME) AS booking_time,
	COUNT(booking_id) AS total_bookings
FROM uber_ncr_data
GROUP BY booking_time
ORDER BY total_bookings desc;