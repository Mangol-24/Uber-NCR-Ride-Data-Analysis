SELECT Incomplete_Rides_Reason,
	COUNT(*) AS total 
FROM uber_ncr_data
WHERE  Incomplete_Rides > 0
GROUP BY Incomplete_Rides_Reason
ORDER BY total DESC;