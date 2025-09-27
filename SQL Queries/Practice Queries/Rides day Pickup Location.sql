SELECT Pickup_Location,
       Day,
       daily_rides
FROM (
    SELECT Pickup_Location,
           Day,
           COUNT(*) AS daily_rides,
           ROW_NUMBER() OVER (PARTITION BY Pickup_Location 
			  ORDER BY COUNT(*) DESC) AS rn
    FROM uber_ncr_data
    GROUP BY Pickup_Location, Day
) ranked
WHERE rn = 1
ORDER BY daily_rides DESC
LIMIT 10;
