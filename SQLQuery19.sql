--Question 2 : Use Copilot to: Find total sales per city 
SELECT 
    City,
    COUNT(*) AS TransactionCount,
    SUM(PurchaseAmount) AS TotalSales,
    AVG(PurchaseAmount) AS AvgSaleAmount,
    MIN(PurchaseAmount) AS MinSaleAmount,
    MAX(PurchaseAmount) AS MaxSaleAmount
FROM SalesData
GROUP BY City
ORDER BY TotalSales DESC;
