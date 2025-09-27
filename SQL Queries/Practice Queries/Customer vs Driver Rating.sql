SELECT 
	ROUND(AVG(Customer_Rating), 2) AS avg_customer_rating,
	ROUND(AVG(Driver_Ratings), 2) AS avg_driver_rating
FROM uber_ncr_data;