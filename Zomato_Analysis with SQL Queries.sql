create schema zomato;
use zomato;
SELECT * FROM zomato.main;
SELECT * FROM zomato.date;
SELECT * FROM zomato.country;
SELECT * FROM zomato.currency;

select * from main
left join currency
using(currency);

SELECT * FROM main
LEFT JOIN country
ON main.countrycode = country.countryid;

select * from main
left join Date
ON main.datekey_opening = date.date_key;



#1. Total Restaurants

#Displays the total number of restaurants in the dataset:
SELECT COUNT(*) AS Total_Restaurants
FROM Main;

#2. Total Cities:
SELECT COUNT(DISTINCT City) AS Total_Cities
FROM Main;

#3. Total Cuisines:
SELECT COUNT(DISTINCT Cuisines) AS Total_Cuisines
FROM Main;

#4. Average Rating:
SELECT AVG(Rating) AS Average_Rating
FROM Main;

#5. Most Voted Restaurant
SELECT RestaurantName, SUM(Votes) AS Total_Votes
FROM Main
GROUP BY RestaurantName
ORDER BY Total_Votes DESC
LIMIT 5; 

/*6. Restaurants by City
For a bar chart showing cities with the most restaurants:*/
SELECT City, COUNT(*) AS Restaurant_Count
FROM Main
GROUP BY City
ORDER BY Restaurant_Count DESC;



/*7. Average Cost for Two by Cuisine
Displays average cost for dining, grouped by cuisine:*/
SELECT Cuisines, AVG(Average_Cost_for_two) AS Avg_Cost
FROM Main
GROUP BY Cuisines
ORDER BY Avg_Cost DESC;


/*8. Top-Rated Restaurants
For a leaderboard of top restaurants:*/
SELECT  restaurantname City, Cuisines, Rating
FROM Main
WHERE Rating IS NOT NULL
ORDER BY Rating DESC
LIMIT 5;



/*9. Delivery Status Insights
For a pie chart of delivery availability:*/


SELECT Is_delivering_now, COUNT(*) AS Count
FROM Main
GROUP BY Is_delivering_now;



/*10. Monthly Restaurant Openings
To show restaurant openings over time:*/


SELECT `Year Opening`, `Month Opening`, COUNT(*) AS Openings
FROM Main
GROUP BY `Year Opening`, `Month Opening`
ORDER BY `Year Opening`, `Month Opening`;

/*11. Popularity by Votes
For a city-based heatmap showing vote counts:*/


SELECT City, SUM(Votes) AS Total_Votes
FROM Main
GROUP BY City
ORDER BY Total_Votes DESC;


#12. Bucket Listwise Sales

SELECT 
    CASE 
        WHEN Average_Cost_for_two <= 300 THEN '0-300'
        WHEN Average_Cost_for_two BETWEEN 301 AND 600 THEN '301-600'
        WHEN Average_Cost_for_two BETWEEN 601 AND 1000 THEN '601-1000'
        ELSE '1001-430000'
    END AS Cost_Bucket,
    COUNT(*) AS Restaurant_Count
FROM Main
GROUP BY 
    CASE 
        WHEN Average_Cost_for_two <= 300 THEN '0-300'
        WHEN Average_Cost_for_two BETWEEN 301 AND 600 THEN '301-600'
        WHEN Average_Cost_for_two BETWEEN 601 AND 1000 THEN '601-1000'
        ELSE '1001-430000'
    END
ORDER BY Restaurant_Count DESC;


#13. Prize Bucket List


SELECT 
    CASE 
        WHEN Average_Cost_for_two <= 500 THEN 'Budget'
        WHEN Average_Cost_for_two BETWEEN 501 AND 1000 THEN 'Moderate'
        WHEN Average_Cost_for_two BETWEEN 1001 AND 2000 THEN 'Expensive'
        ELSE 'Luxury'
    END AS Price_Bucket,
    COUNT(*) AS Restaurant_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Main), 2) AS Percentage
FROM Main
GROUP BY 
    CASE 
        WHEN Average_Cost_for_two <= 500 THEN 'Budget'
        WHEN Average_Cost_for_two BETWEEN 501 AND 1000 THEN 'Moderate'
        WHEN Average_Cost_for_two BETWEEN 1001 AND 2000 THEN 'Expensive'
        ELSE 'Luxury'
    END;


#14. Has Booking Table

SELECT 
    Has_table_booking AS Booking_Table,
    COUNT(*) AS Restaurant_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Main), 2) AS Percentage
FROM Main
GROUP BY Has_table_booking;

#15. Count of Restaurants by Online Delivery
SELECT 
    Is_delivering_now, 
    COUNT(*) AS Restaurant_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Main), 2) AS Percentage
FROM Main
GROUP BY Is_delivering_now;

#16. Monthwise Sales

SELECT `Month Opening` AS Month, COUNT(*) AS Total_Restaurants
FROM Main
GROUP BY `Month Opening`
ORDER BY FIELD(`Month Opening`, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 
'October', 'November', 'December');

#17. Has Online Delivery

SELECT 
    Is_delivering_now AS Online_Delivery,
    COUNT(*) AS Restaurant_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Main), 2) AS Percentage
FROM Main
GROUP BY Is_delivering_now;



#18. City-wise Average Cost for Dining
SELECT City, AVG(Average_Cost_for_two) AS Avg_Cost_for_Two
FROM Main
GROUP BY City
ORDER BY Avg_Cost_for_Two DESC;







#19
SELECT City, COUNT(*) AS Total_Restaurants
FROM Main
GROUP BY City
ORDER BY Total_Restaurants DESC;


#20 Monthly Restaurant Openings:

SELECT `Year Opening`, `Month Opening`, COUNT(*) AS Openings
FROM Main
GROUP BY `Year Opening`, `Month Opening`
ORDER BY `Year Opening`, `Month Opening`;

    
#21 Restaurant Opening
SELECT `Year Opening` AS Year, COUNT(*) AS Restaurant_Openings
FROM Main
GROUP BY `Year Opening`
ORDER BY `Year Opening`;


#22 Number of Outlets and Average Rating by Restaurant Name
SELECT RestaurantName, COUNT(*) AS Number_of_Outlets, AVG(Rating) AS Average_Rating
FROM Main
GROUP BY RestaurantName
ORDER BY Number_of_Outlets DESC;

































