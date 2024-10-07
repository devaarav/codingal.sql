CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    TotalSpending DECIMAL(10, 2)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, City, TotalSpending) VALUES
(1, 'Alice', 'Williams', 'New York', 1200.50),
(2, 'Bob', 'Johnson', 'Los Angeles', 800.00),
(3, 'Charlie', 'Brown', 'Chicago', 2000.00),
(4, 'David', 'Smith', 'Houston', 1500.75),
(5, 'Eve', 'Davis', 'Phoenix', 500.00);

CREATE TABLE HighValueCustomers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    TotalSpending DECIMAL(10, 2)
);

INSERT INTO HighValueCustomers (CustomerID, FirstName, LastName, City, TotalSpending)
SELECT CustomerID, FirstName, LastName, City, TotalSpending
FROM Customers
WHERE TotalSpending > 1000;

CREATE TABLE AggregatedHighValueCustomers AS
SELECT 
    City,
    COUNT(CustomerID) AS NumberOfCustomers,
    AVG(TotalSpending) AS AverageSpending,
    MIN(TotalSpending) AS MinimumSpending,
    MAX(TotalSpending) AS MaximumSpending,
    SUM(TotalSpending) AS TotalSpending
FROM HighValueCustomers
GROUP BY City
ORDER BY AverageSpending DESC;
