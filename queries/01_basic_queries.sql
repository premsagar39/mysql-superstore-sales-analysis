#all columns
select * from superstore;

#how many columns
select count(*) from superstore;

#Find customers from selected regions
SELECT DISTINCT CustomerName,region
FROM superstore
WHERE region IN ('West', 'East');

#Customers NOT from selected regions
SELECT customername, region
FROM superstore
WHERE region NOT IN ('West','East');

