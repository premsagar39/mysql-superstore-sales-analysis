#Seasonal Analysis by Quarter
SELECT 
    CASE 
        WHEN MONTH(OrderDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(OrderDate) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    AVG(Sales) AS Avg_Sale_Amount,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Avg_Profit
FROM SuperStore
GROUP BY 
    CASE 
        WHEN MONTH(OrderDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(OrderDate) IN (9, 10, 11) THEN 'Fall'
    END
ORDER BY Total_Sales DESC;

#Seasonal Analysis with Month Details
SELECT 
    CASE 
        WHEN MONTH(OrderDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(OrderDate) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    MONTHNAME(OrderDate) AS Month_Name,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM SuperStore
GROUP BY 
    CASE 
        WHEN MONTH(OrderDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(OrderDate) IN (9, 10, 11) THEN 'Fall'
    END,
    MONTHNAME(OrderDate),
    MONTH(OrderDate)
ORDER BY Season, MONTH(OrderDate);

#Seasonal Analysis by Product Category
SELECT 
    ProductCategory,
    CASE 
        WHEN MONTH(OrderDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(OrderDate) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantityorderednew) AS Total_Units_Sold
FROM SuperStore
GROUP BY ProductCategory,
    CASE 
        WHEN MONTH(OrderDate) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(OrderDate) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(OrderDate) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(OrderDate) IN (9, 10, 11) THEN 'Fall'
    END
ORDER BY ProductCategory, Total_Sales DESC;
