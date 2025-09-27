SELECT 
    payment_method,
    COUNT(booking_id) AS total_bookings,
    ROUND(
        (COUNT(booking_id) * 100.0 / (SELECT COUNT(*) FROM ncr_ride_data WHERE payment_method IS NOT NULL)),
        2
    ) AS percentage
FROM ncr_ride_data
WHERE payment_method IS NOT NULL
GROUP BY payment_method
ORDER BY total_bookings DESC;