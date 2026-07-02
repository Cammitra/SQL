--Find customers with purchases above average
WITH AvgPurchase AS (
    SELECT AVG(PurchaseAmount) AS AvgAmount FROM SalesData
)
SELECT 
    CustomerID,
    Name,
    City,
    Age,
    PurchaseAmount,
    PurchaseDate
FROM SalesData
CROSS JOIN AvgPurchase
WHERE PurchaseAmount > AvgAmount
ORDER BY PurchaseAmount DESC;
