CREATE DATABASE rmDB
Go

USE rmDB
GO

---------------------------1.CREATE TABLE Menugroup-----------------------------
CREATE TABLE foodMenu
(
    CatagoryId INT PRIMARY KEY IDENTITY ,
	[Name] VARCHAR(100) NOT NULL
)
GO

SELECT *FROM foodMenu
GO
INSERT INTO foodMenu VALUES
('Buger'),
('Pizza')

GO
----------------------------2.CREATE TABLE ItemDetails--------------------------
CREATE TABLE fooditem
(
	ItemId INT PRIMARY KEY IDENTITY,
	CatagoryId INT REFERENCES foodMenu(CatagoryId),
	ItemName VARCHAR(100) NOT NULL,
	ItemDate DATE  NULL,
	UnitPrice MONEY NOT NULL,
	strock BIT NOT NULL,
	
)

GO

SELECT *FROM fooditem
GO
INSERT INTO fooditem VALUES
(1,'Naga Burger','02/03/2022',350.00,1),
(2,'Pizza chicken', '02/03/2022',350.00,2)

GO
------------------------------3.CREATE TABLE Customers----------------------------
CREATE TABLE customers
(
	     CustId INT PRIMARY KEY,
	     CustomerFName NVARCHAR(20) NOT NULL,
	     CustomerLName NVARCHAR(20)  NULL,
	     PhoneNo VARCHAR(17) CHECK(PhoneNo like '%[0-9]') DEFAULT NULL
)
GO
SELECT *FROM customers
GO
-------------------------------4.CREATE TABLE Designation-------------------------
CREATE TABLE designation
(
	    DesigId INT PRIMARY KEY IDENTITY,
	    Titlename VARCHAR(52) NOT NULL
)
GO

SELECT *FROM designation
GO
-----------------------------5.CREATE TABLE Employees------------------------------
CREATE TABLE employees
(
	    EmpId INT PRIMARY KEY,
	    [Name]NVARCHAR(100) NOT NULL,
	    DesigId INT REFERENCES designation(DesigId),
	    PhoneNo NVARCHAR(17) NOT NULL,
	    Gender NVARCHAR(50) NOT NULL,
	    Age INT NOT NULL,
	    NID CHAR(13) NOT NULL UNIQUE, --CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')--
	    Email NVARCHAR(50) NULL,
	    Empcity NVARCHAR(20) NOT NULL,
	    Empcountry NVARCHAR(30) NULL,
	    EmpImage  NVARCHAR(MAX) NOT NULL DEFAULT 'N/A',
	    [Address] NVARCHAR(200) NOT NULL
)
GO

SELECT *FROM employees
GO
------------------------------6.CREATE TABLE TableDetails-------------------------

CREATE TABLE tableDetails
(
	     TableId INT PRIMARY KEY IDENTITY, 
	     [Name] NVARCHAR(50) NOT NULL,
	     EmpId INT REFERENCES employees(EmpId),
)
GO

SELECT *FROM tableDetails
GO

----------------------------7.CREATE TABLE Orders------------------------------------
CREATE TABLE orders
(
	      OrderId INT PRIMARY KEY IDENTITY,
	      CustId INT REFERENCES customers(CustId),
	      TableId INT REFERENCES tableDetails(TableId),
	      ItemId INT REFERENCES foodItem(ItemId ),
		  OrderDate DATE  NULL,
	      Quantity INT,
	      Discount FLOAT NOT NULL DEFAULT 0,
	      Amount AS (Quantity*Discount)
	
)
GO
(SELECT foodItem.UnitPrice*orders.Quantity*(1-Discount)'Total' FROM foodItem,orders WHERE foodItem.ItemId=orders.OrderId )
GO

SELECT *FROM orders
GO
