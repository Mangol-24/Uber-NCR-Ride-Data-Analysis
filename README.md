# Uber-NCR-Ride-Data-Analysis

This project analyzes UBER ride data for the NCR (National Capital Region) to extract meaningful insights about ride patterns, customer behavior, and service performance. The analysis covers various aspects including booking trends, cancellation reasons, popular locations, payment methods, and more.

## Project Objectives 
-- Understand demand patterns across time, Location amd Vehical type
-- Analyze **Cancellations** and identify reliability challenges
-- Compare **payment method preferences**
-- Highlight **Top-Performing and underperforming routes**
-- Build a **Power BI Dashboard** for intereactive analysis

----

## Tools & Technologies Used
-- **Excel** → Basic Cleaning and preparation
-- **SQL** → Query practice for trend and route analysis
-- **Power BI (DAX)** → Dashboard design and calculation 

----

## Dataset
-- 150000+ ride bookings (sample for analysis)
-- Key Fields: `Booking_ID`, `Date`, `Time`, `Pickup`, `Drop`, `Vehicle Type`, `Ride_Status`, `Payment Method`, `Booking Value`, `Ride Distance`  
-- *Dataset used for academic/learning purposes only* 

## Key Insights
-- **Total Bookings:** 150K
-- **Total Revenue:** ₹51.85M
-- **Average Booking Value:** ₹508
-- **Cancellations Rate:** 38%
-- **Peak Hour:** 232(Evening 4-9 PM)

## Payment Preferences 
-- **UPI** dominates with ~45% of bookings
-- **Cash** is second with ~25% 
-- Digital Pyments (Wallet, Cards) together comprise total 32% this is a scope to promote cashless

## Vehicle Insights 
-- **Autos** lean in completed rides (23K) but also have the highest cancellations
-- **Go Mini(18.5K)** and **Go Sedan(16.6K)** perform well with lower cancellation ratios
-- Ride distance stay consistant (~24-25 km), showing reliability

## Demand Trends 
--bookings peak **Morning(9-11 am)** and **Evening (4-9 pm)**
--**Evening demand > Morning demand** → return-home commuters are more in numbers 
-- No late-night demand → Uber is mostly used by school and work Commuters
-- Weekends do not show major surges which confirming work-orianted use 

## Top Route Performence
-Examples:
-- **Rohini West → Shona Road** → High Sucess (93% Completion)
-- **Ghaziabad → Badshahpur** → High Cancellations (60%)
-- **Akshardham → RK Puram** → cancellation rate 56%
-Insight: Some long-distance routes face reliability issues 

----

## Dashboard Preview
[Dashboard File Link](https://drive.google.com/file/d/1wy0UgU9JN8WLrnCt5rTfubFKx6vTB_iF/view?usp=drive_link)

-The dashboard shows:
-- KPI: Total Bookings, Completed Rides, Avg Booking Value, Cancellation Rate, Peak Hour Rides
-- Rides by **Day, Hour, Vehicle Type, Payment Method**
-- **Top 10 pickup-drop pairs** with completion and cancellation rate
-- Average Booking value and Average Ride distance by Day
-- Reason for cancelling rides by **Customer**
-- Avarage Ride Distance and Booking Value by Vehicle Type
-- Cancellation reasons breakdown 

----

## SQL Queries
-- **Average Booking value and ride distance by Day**
  [SQL file in Google Drive](https://drive.google.com/file/d/1u6U_YRVfkfVHuFddS2kIYPn3RwKiEP06/view?usp=drive_link)
  
  SELECT DAY,
	ROUND(AVG(Booking_Value), 2) AS avg_booking_value,
	ROUND(AVG(Ride_Distance), 2) AS avg_ride_distance
FROM uber_ncr_data
WHERE Booking_Status = 'Completed'
GROUP BY DAY
ORDER BY DAY;

--**Payment method by total bookings and Percentage**
[SQL file in Google Drive](https://drive.google.com/file/d/1qP5SE-osq-FoYVkT9vnG5EEf6tI9Or5f/view?usp=drive_link)

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

--**Rides by Vehicle Type and Status**
[SQL file in Google Drive](https://drive.google.com/file/d/1euRKKkCRqDyYdov8L3BBlRA2kGd6mUcM/view?usp=drive_link)

SELECT Vehicle_Type, Booking_Status,
	COUNT(Booking_ID) AS total_rides
FROM ncr_ride_data
GROUP BY Vehicle_Type,Booking_Status
ORDER BY Vehicle_Type,Booking_Status;

--**Avarage Ride Distance and Booking Value by Vehicle Type**
[SQL file in Google Drive](https://drive.google.com/file/d/1hKi9LUiJ_BRQoSMrfZWDw_XvW-acIcDk/view?usp=drive_link)

SELECT Vehicle_Type,
	ROUND(AVG(Ride_Distance), 2) AS avg_ride_distance,
	ROUND(AVG(Booking_Value), 2) AS avg_booking_value
FROM ncr_ride_data
WHERE Booking_Status = 'Completed'
GROUP BY Vehicle_Type
ORDER BY avg_booking_value DESC;

--**Reasons for Cancelling Rides(Customer)**
[SQL file in Google Drive](https://drive.google.com/file/d/1QmTY_IybsHva1LokYqw9CIW33W28sj6H/view?usp=drive_link)

SELECT 
    vehicle_type,
    reason_for_cancelling_by_customer,
    COUNT(booking_id) AS cancellation_count
FROM ncr_ride_data
WHERE booking_status = 'Cancelled by Customer'
    AND reason_for_cancelling_by_customer IS NOT NULL
GROUP BY vehicle_type, reason_for_cancelling_by_customer
ORDER BY vehicle_type, cancellation_count DESC;

--**Top 10 Routes ( Performance Overview)**
[SQL file in Google Drive](https://drive.google.com/file/d/1zS84ItdhCWJNz0X67oBCF8vbjzD7MTcW/view?usp=drive_link)

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

## DAX Measures in Power BI

-- **Average Ride Distance**
Avarage Ride Distance = AVERAGE(ncr_ride_data[Ride Distance])

--**Average Booking Value**
Avg Booking Value = AVERAGE(ncr_ride_data[Booking Value])

-- **Average Driver Rating**
Avg Driver Rating = AVERAGE(ncr_ride_data[Driver Ratings])

--**Cancellation Rate**
Cancellation Rate = DIVIDE(CALCULATE(COUNTROWS(ncr_ride_data),ncr_ride_data[Booking Status] IN { "Incomplete", "Cancelled by Customer", "Cancelled by Driver", "Incomplete", "No Driver Found" }),[Total Bookings],0)

-- **Peak Hour Rides**
Peak Hour Rides = 
VAR MaxHour = 
    MAXX(
        SUMMARIZE(ncr_ride_data, ncr_ride_data[Time], "RideCount", COUNTROWS(ncr_ride_data)),
        [RideCount]
    )
RETURN MaxHour

-- **Total Bookings**
Total Bookings = COUNT('ncr_ride_data'[Booking ID])

-- **Total Completed Rides**
Total Completed Rides = 
CALCULATE(
  COUNTROWS('ncr_ride_data'),
  'ncr_ride_data'[Booking Status] = "Completed"
)

-- **Total Revenue**
Total Revenue = SUM(ncr_ride_data[Booking Value])














