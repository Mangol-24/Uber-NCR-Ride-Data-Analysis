SELECT 
    pickup_location,
    drop_location,
    ROUND(AVG(booking_value), 2) AS avg_booking_value,
    ROUND(
        SUM(CASE WHEN booking_status IN ('Cancelled by Driver', 'Cancelled by Customer') THEN 1 ELSE 0 END) * 100.0 / COUNT(booking_id),
        2
    ) AS cancellation_rate_percent,
    COUNT(booking_id) AS total_bookings,
    SUM(CASE WHEN booking_status = 'Completed' THEN 1 ELSE 0 END) AS completed_rides
FROM ncr_ride_data
GROUP BY pickup_location, drop_location
HAVING COUNT(booking_id) >= 10  -- Avoid low-volume routes
ORDER BY avg_booking_value DESC, cancellation_rate_percent ASC
LIMIT 10;