SELECT Reason_for_cancelling_by_Customer,
	COUNT(*) AS cancellations
FROM uber_ncr_data
WHERE Cancelled_Rides_by_Customer > 0
GROUP BY Reason_for_cancelling_by_Customer
ORDER BY cancellations DESC;

