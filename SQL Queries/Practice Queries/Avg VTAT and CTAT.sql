SELECT 
	ROUND(AVG(Avg_VTAT), 2) AS avg_vehical_tat,
	ROUND(AVG(Avg_CTAT), 2) AS avg_customer_tat
FROM uber_ncr_data;