SELECT 
	(SUM(Incomplete_Rides) * 100 / COUNT(*)) AS incomplete_percentage
FROM uber_ncr_data;