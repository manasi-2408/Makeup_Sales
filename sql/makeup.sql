CREATE DATABASE makeups;
USE makeups;

SELECT 
    *
FROM
    cleaned;
    
-- ============================================================================
-- 	PROBLEM STATEMENT
-- Skincare business is generating sales, but we do not clearly understand which factors are 
-- driving revenue growth, customer satisfaction, and product returns. We need to identify 
-- the key drivers behind customer purchasing behavior, product performance, pricing 
-- effectiveness, and regional/channel performance so we can improve profitability, 
-- reduce returns, and make better business decisions.
-- ============================================================================


-- 1. Sales & Revenue Analysis
-- Does giving discounts increase sales and revenue?

SELECT 
    Discount_Percent,
    ROUND(SUM(Revenue_INR),2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Discount_Percent
ORDER BY Discount_Percent;


-- Which brands generate the highest revenue?

SELECT 
    Brand,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Brand
ORDER BY Total_Revenue DESC;


-- Which categories generate the highest sales and revenue?

SELECT 
    Category,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Category
ORDER BY Total_Revenue DESC;


-- Which region generates the highest sales and revenue?

SELECT 
    Region,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Region
ORDER BY Total_Revenue DESC;


-- Which sales channel generates the highest revenue?

SELECT 
    Sales_Channel,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Sales_Channel
ORDER BY Total_Revenue DESC;


-- Which month generates the highest sales?

SELECT 
    Month,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Month
ORDER BY Total_Revenue DESC;


-- In which season is peak revenue generated?

SELECT 
    Quarter, ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM
    cleaned
GROUP BY Quarter
ORDER BY Total_Revenue DESC;


-- Are sales higher during weekends?

SELECT 
    Is_weekend, ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM
    cleaned
GROUP BY Is_weekend
ORDER BY Total_Revenue DESC;


-- Which products contribute the most to total revenue?

SELECT 
    Brand,
    Category,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM cleaned
GROUP BY Brand, Category
ORDER BY Total_Revenue DESC;

-- Which price range generates maximum revenue?

SELECT 
    Price_Range, ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM
    cleaned
GROUP BY Price_Range
ORDER BY Total_Revenue DESC;


-- ============================================================================


-- 2. Customer Behavior Analysis
-- Which age group purchases the most products?

SELECT 
    Age_Group,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    SUM(Units_Sold) AS Total_Units_Sold
FROM
    cleaned
GROUP BY Age_Group
ORDER BY Total_Revenue DESC;


-- Which gender purchases the most?

SELECT 
    Customer_Gender,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    SUM(Units_Sold) AS Total_Units_Sold
FROM
    cleaned
GROUP BY Customer_Gender
ORDER BY Total_Revenue DESC;


-- Which skin type generates the highest sales?

SELECT 
    Skin_Type,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    SUM(Units_Sold) AS Total_Units_Sold
FROM
    cleaned
GROUP BY Skin_Type
ORDER BY Total_Revenue DESC;


-- Which customer segment spends the most per order?

SELECT 
    Age_Group, ROUND(AVG(Revenue_INR), 2) AS Avg_Spend_Per_Order
FROM
    cleaned
GROUP BY Age_Group
ORDER BY Avg_Spend_Per_Order DESC;


-- Which age group prefers premium products?

SELECT 
    Age_Group,
    SUM(CASE
        WHEN Price_Range = 'Premium' THEN 1
        ELSE 0
    END) AS Premium_Products
FROM
    cleaned
GROUP BY Age_Group
ORDER BY Premium_Products DESC;


-- Which combinations of age group and skin type generate the highest revenue?

SELECT 
    Age_Group,
    Skin_Type,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM
    cleaned
GROUP BY Age_Group , Skin_Type
ORDER BY Total_Revenue DESC;

-- ============================================================================


-- 3. Pricing & Discount Analysis
-- What percentage of revenue comes from discounted sales?

SELECT 
    ROUND(SUM(CASE
                WHEN Discount_Percent > 0 THEN Revenue_INR
                ELSE 0
            END),
            2) AS Discounted_Revenue,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(SUM(CASE
                WHEN Discount_Percent > 0 THEN Revenue_INR
                ELSE 0
            END) / SUM(Revenue_INR) * 100,
            2) AS Discounted_Revenue_Percent
FROM
    cleaned;


-- Is higher pricing associated with lower sales volume?

SELECT 
    Price_Range,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM cleaned
GROUP BY Price_Range
ORDER BY Avg_Units_Sold ASC;


-- What is the optimal discount range for maximizing revenue?

SELECT 
    CASE
        WHEN Discount_Percent = 0 THEN 'No Discount'
        WHEN Discount_Percent BETWEEN 1 AND 10 THEN 'Low (1-10%)'
        WHEN Discount_Percent BETWEEN 11 AND 20 THEN 'Medium (11-20%)'
        ELSE 'High (21-25%)'
    END AS Discount_Bucket,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Units_Sold), 2) AS Avg_Units_Sold
FROM
    cleaned
GROUP BY Discount_Bucket
ORDER BY Total_Revenue DESC;


-- Which brands depend heavily on discounts?

SELECT 
    Brand,
    ROUND(SUM(CASE
                WHEN Discount_Percent > 0 THEN Revenue_INR
                ELSE 0
            END) / SUM(Revenue_INR) * 100,
            2) AS Discounted_Revenue_Percent,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM
    cleaned
GROUP BY Brand
ORDER BY Discounted_Revenue_Percent DESC;


-- ============================================================================


-- 4. Product & Brand Performance Analysis
-- Which brands contribute the highest percentage of total revenue?

SELECT 
    Brand,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(SUM(Revenue_INR) / (SELECT 
                    SUM(Revenue_INR)
                FROM
                    cleaned) * 100,
            2) AS Revenue_Percentage
FROM
    cleaned
GROUP BY Brand
ORDER BY Revenue_Percentage DESC;


-- Which products generate high revenue but low ratings?

SELECT 
    Brand,
    Category,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM
    cleaned
GROUP BY Brand , Category
HAVING SUM(Revenue_INR) > 0 AND AVG(Rating) < 3.5
ORDER BY Total_Revenue DESC;


-- Which products generate high sales but low customer satisfaction?

SELECT 
    Brand,
    Category,
    SUM(Units_Sold) AS Total_Units_Sold,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM
    cleaned
GROUP BY Brand , Category
HAVING SUM(Units_Sold) > 0 AND AVG(Rating) < 3
ORDER BY Total_Units_Sold DESC;


-- Which categories perform best in each region?

SELECT 
    Region,
    Category,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue
FROM
    cleaned
GROUP BY Region , Category
ORDER BY Region , Total_Revenue DESC;


-- ============================================================================


-- 5. Customer Ratings & Satisfaction Analysis
-- Which brands have the highest average customer ratings?

SELECT 
    Brand, ROUND(AVG(Rating), 2) AS Avg_Rating
FROM
    cleaned
GROUP BY Brand
ORDER BY Avg_Rating DESC;


-- Do highly rated products generate higher revenue?

SELECT 
    High_Rating,
    ROUND(SUM(Revenue_INR), 2) AS Total_Revenue,
    COUNT(*) AS Product_Count
FROM
    cleaned
GROUP BY High_Rating
ORDER BY Total_Revenue DESC;


-- Which products have low ratings and low sales?

SELECT 
    Brand,
    Category,
    SUM(Units_Sold) AS Total_Units_Sold,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM
    cleaned
GROUP BY Brand , Category
HAVING SUM(Units_Sold) < 50 AND AVG(Rating) < 3
ORDER BY Total_Units_Sold ASC , Avg_Rating ASC;


-- ============================================================================


-- 6. Return Analysis
-- What factors are causing product returns?

SELECT 
    Category,
    Brand,
    ROUND(AVG(Discount_Percent), 2) AS Avg_Discount,
    ROUND(AVG(Price_INR), 2) AS Avg_Price,
    ROUND(AVG(Rating), 2) AS Avg_Rating,
    COUNT(*) AS Return_Count
FROM
    cleaned
WHERE
    Returned = 1
GROUP BY Category , Brand
ORDER BY Return_Count DESC;


-- Do low ratings or higher pricing increase return rates?

SELECT 
    CASE
        WHEN Rating < 3 THEN 'Low Rating'
        WHEN Rating BETWEEN 3 AND 4 THEN 'Medium Rating'
        ELSE 'High Rating'
    END AS Rating_Group,
    CASE
        WHEN Price_INR < 500 THEN 'Low Price'
        WHEN Price_INR BETWEEN 500 AND 1500 THEN 'Medium Price'
        ELSE 'High Price'
    END AS Price_Group,
    ROUND(AVG(Returned) * 100, 2) AS Return_Rate_Percent
FROM
    cleaned
GROUP BY Rating_Group , Price_Group
ORDER BY Return_Rate_Percent DESC;


-- Which products have the highest return rates?

SELECT 
    Brand,
    Category,
    SUM(Returned) AS Total_Returns,
    ROUND(SUM(Returned) / SUM(Units_Sold) * 100, 2) AS Return_Rate_Percent
FROM
    cleaned
GROUP BY Brand , Category
HAVING SUM(Returned) > 0
ORDER BY Return_Rate_Percent DESC , Total_Returns DESC;


-- ==========================================================================================================

-- The overall analysis concludes that the skincare business is primarily driven by product quality, 
-- customer satisfaction, premium product positioning, customer demographics, and strong regional/channel 
-- performance rather than discounts alone. High customer ratings positively influence revenue, 
-- while low-rated products contribute to higher return rates and lower long-term business value. 
-- To improve profitability and business growth, the company should focus on enhancing product quality, 
-- optimizing premium offerings, targeting high-value customer segments, reducing return-prone products, 
-- and implementing region-specific and customer-focused business strategies.  