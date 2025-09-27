SELECT 
	SUM(cancelled_rides_by_customer) AS total_customer_cancellatios,
	SUM(cancelled_rides_by_driver) AS total_driver_cancellations
FROM uber_ncr_data;