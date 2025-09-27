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








