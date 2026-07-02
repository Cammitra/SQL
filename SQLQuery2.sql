--Total sales per city

SELECT
    City,
    SUM(PurchaseAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY City
ORDER BY City;

