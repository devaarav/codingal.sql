CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000),
(2, 'Jane', 'Smith', 'IT', 48000),
(3, 'Mark', 'Johnson', 'Sales', 62000),
(4, 'Lucy', 'Brown', 'IT', 72000),
(5, 'Mike', 'Davis', 'HR', 45000);

SELECT 
    COUNT(EmployeeID) AS TotalEmployees,
    AVG(Salary) AS AverageSalary,
    MIN(Salary) AS MinimumSalary,
    MAX(Salary) AS MaximumSalary,
    SUM(Salary) AS TotalSalary
FROM Employees;


CREATE TABLE HighSalaryEmployees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO HighSalaryEmployees (EmployeeID, FirstName, LastName, Department, Salary)
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees
WHERE Salary > 50000
AND Department = 'IT';
