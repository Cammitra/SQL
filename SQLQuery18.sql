--create a table SalesData whose columns are CustomerID, Name, Age, City, PurchaseAmount, PurchaseDate and then ask to insert 10,000 rows of random data
-- Drop the table if it already exists
DROP TABLE IF EXISTS SalesData;

-- Create the SalesData table
CREATE TABLE SalesData (
    CustomerID INT PRIMARY KEY IDENTITY(1, 1),
    Name NVARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    City NVARCHAR(100) NOT NULL,
    PurchaseAmount DECIMAL(10, 2) NOT NULL,
    PurchaseDate DATE NOT NULL
);

-- Insert 10,000 rows of random data using recursive CTE
WITH NumberGenerator AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM NumberGenerator
    WHERE num < 10000
)
INSERT INTO SalesData (Name, Age, City, PurchaseAmount, PurchaseDate)
SELECT
    CONCAT('Customer_', num),
    ABS(CHECKSUM(NEWID())) % 60 + 18,  -- Age between 18-77
    CASE ABS(CHECKSUM(NEWID())) % 5
        WHEN 0 THEN 'New York'
        WHEN 1 THEN 'Los Angeles'
        WHEN 2 THEN 'Chicago'
        WHEN 3 THEN 'Houston'
        ELSE 'Phoenix'
    END,
    CAST((ABS(CHECKSUM(NEWID())) % 5000) + 10.00 AS DECIMAL(10, 2)),  -- Purchase amount 10-5010
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-01-01')  -- Random date in 2024
FROM NumberGenerator
OPTION (MAXRECURSION 10000);

-- Verify the data was inserted
SELECT COUNT(*) AS [RowCount] FROM SalesData;
SELECT TOP 10 * FROM SalesData;
