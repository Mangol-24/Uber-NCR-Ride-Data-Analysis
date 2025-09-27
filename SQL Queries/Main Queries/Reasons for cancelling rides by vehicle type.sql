SELECT 
    vehicle_type,
    reason_for_cancelling_by_customer,
    COUNT(booking_id) AS cancellation_count
FROM ncr_ride_data
WHERE booking_status = 'Cancelled by Customer'
    AND reason_for_cancelling_by_customer IS NOT NULL
GROUP BY vehicle_type, reason_for_cancelling_by_customer
ORDER BY vehicle_type, cancellation_count DESC;