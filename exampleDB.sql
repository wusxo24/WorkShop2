SELECT TOP (1000) [ItemID]
      ,[itemName]
      ,[Quantity]
  FROM [SampleDB].[dbo].[Items]


Select ItemID, ItemName, Quantity from Items

delete Items where ItemId = '003'

INSERT Items (ItemID, itemName, Quantity) VALUES

 ('004', 'Tea', 400)

update Items set itemName= 'Milk', Quantity = 200 where ItemID = 002

CREATE TABLE Registration (

	[UserName] [varchar](30) NOT NULL,

	[Password] [varchar](30) NOT NULL,

	[LastName] [nvarchar](50) NOT NULL,
	
	[isAdmin] [bit] NOT NULL
);

USE SampleDB

INSERT INTO [dbo].[Registration]
           ([UserName]
           ,[Password]
           ,[LastName]
           ,[isAdmin])
     VALUES
		    ('U001', '123', 'Tom', 'True'),
			('U002', '456', 'David', 'False'),
			('U003', '789', 'John', 'False'),
			('U004', '012', 'Mark', 'True'),
			('U005', '134', 'Kate', 'False')
GO

update Registration set IsAdmin= 'TRUE' where UserName = 'U001'

DELETE FROM [dbo].[Registration]
      WHERE UserName = 'U001'

SELECT TOP (1000) [UserName]
      ,[Password]
      ,[LastName]
      ,[isAdmin]
  FROM [SampleDB].[dbo].[Registration]

SELECT LastName, isAdmin FROM Registration where [UserName]='U002' and [Password]='345'

SELECT UserName, Password, LastName, isAdmin FROM Registration where LastName like 'Tom'

Update Registration set Password= '123', LastName= 'Tom', isAdmin= 'TRUE' where UserName= 'U002'
Update Registration set Password= '456', LastName= 'David', isAdmin= 'FALSE' where UserName= 'U001'
Update Registration set Password= '123', LastName= 'Tom', isAdmin= 'TRUE' where UserName= 'U001'
Update Registration set Password= '456', LastName= 'David', isAdmin= 'FALSE' where UserName= 'U002'

Create database ShoppingCart
Use ShoppingCart

CREATE TABLE [dbo].[Request] (

	[requestID] [int] IDENTITY(1,1) NOT NULL,

	[status] [nvarchar](50) NOT NULL, 

	[submittedDate] [datetime] NOT NULL,

	[description] [text] NULL,

	[deviceID] [int] NULL,

	[clientID] [int] NOT NULL,

	[technicianID] [int] NULL, 

	[cancellationReason] [nvarchar](255) NULL,

 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED ([requestID] ASC),

	FOREIGN KEY (deviceID) REFERENCES [dbo].[Device](deviceID),

	FOREIGN KEY (clientID) REFERENCES [dbo].[User](userID),

	FOREIGN KEY (technicianID) REFERENCES [dbo].[User](userID)

);

CREATE TABLE [dbo].[Contract_Service] (

	[contractID] [int] NOT NULL,

	[serviceID] [int] NOT NULL,

	[quantity] [int] NULL,

	 CONSTRAINT [PK_Contract_Service] PRIMARY KEY CLUSTERED ([contractID], [serviceID])
	):



 CREATE TABLE [dbo].[Book] (

	[Id] [varchar](30) NOT NULL,

	[Title] [varchar](30) NOT NULL,

	[Price] [float](53) NOT NULL

	);
	CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED ([Id]),

INSERT INTO [dbo].[Book]
           ([Id]
           ,[Title]
           ,[Price])
     VALUES
		    ('B001', 'C#', 10.5),
			('B002', 'Java', 11.5),
			('B003', 'Spring', 12.5),
			('B004', 'JSP', 13.5),
			('B005', 'Ruby', 14.5)


 CREATE TABLE [dbo].[CartItem] (

	[itemId] [varchar](30) NOT NULL,

	[itemName] [varchar](30) NOT NULL,

	[quantity] [int] NOT NULL,

	[unitPrice] [float](53) NOT NULL
);

CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED ([itemId]),

FOREIGN KEY (itemId) REFERENCES [dbo].[Book](Id),

FOREIGN KEY (itemName) REFERENCES [dbo].[Book](Title),


FOREIGN KEY (unitPrice) REFERENCES [dbo].[Book](Price)

SELECT [Id]
      ,[Title]
      ,[Price]
  FROM [ShoppingCart].[dbo].[Book]

SELECT TOP (1000) [itemId]
      ,[itemName]
      ,[quantity]
      ,[unitPrice]
  FROM [ShoppingCart].[dbo].[CartItem]

INSERT INTO [dbo].[CartItem]
           ([itemName]
           ,[quantity]
           ,[unitPrice])
     VALUES
		    (?, ?, ?)
Create database MyStock

Use MyStock

CREATE TABLE Cars (

	[CarID] [int] NOT NULL,

	[CarName] [varchar](50) NOT NULL,

	[Manufacturer] [varchar](50) NOT NULL,
	
	[Price] [money] NOT NULL,
	
	[ReleasedYear] [int] NOT NULL
);

USE SampleDB

INSERT INTO [dbo].[Registration]
           ([UserName]
           ,[Password]
           ,[LastName]
           ,[isAdmin])
     VALUES
		  


INSERT INTO [dbo].[Cars]
           ([CarID]
           ,[CarName]
           ,[Manufacturer]
           ,[Price]
           ,[ReleasedYear])
     VALUES
            (1, 'Accord', 'Honda Motor Company', 24970, 2021),
			(3, 'Clarity', 'Hona Motor Company', 33400, 2021),
			(4, 'BMW 8 Series', 'BMW', 85000, 2021),
			(5, 'Audi A6', 'Audi', 14000, 2020)
GO

SELECT TOP (1000) [CarID]
      ,[CarName]
      ,[Manufacturer]
      ,[Price]
      ,[ReleasedYear]
  FROM [MyStock].[dbo].[Cars]
  
UPDATE [dbo].[Cars]
   SET 
      ,[CarName] = ?
      ,[Manufacturer] = ?
      ,[Price] = ?
      ,[ReleasedYear] = ?
 WHERE [CarID] = ?

 select [CarName], [Manufacturer], [Price], [ReleasedYear] where [CarID] = ?

Create database MyShop

Use MyShop

CREATE TABLE Mobiles (

	[mobileId] [varchar](10) NOT NULL,

	[description] [varchar](250) NOT NULL,

	[price] [float] NOT NULL,
	
	[mobileName] [varchar](20) NOT NULL,
	
	[yearOfProduction] [int] NOT NULL,

	[quantity] [int] NOT NULL,

	[notSale] [bit] NOT NULL,

	CONSTRAINT [PK_Mobiles] PRIMARY KEY CLUSTERED ([mobileId])
);

CREATE TABLE Users (

	[userId] [varchar](20) NOT NULL,

	[password] [int] NOT NULL,

	[fullName] [varchar](50) NOT NULL,
	
	[role] [int] NOT NULL,

	CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([userId])
	
);

INSERT INTO Mobiles (mobileId, description, price, mobileName, yearOfProduction, quantity, notSale) VALUES
('M001', 'Latest model with advanced features', 699.99, 'Galaxy S21', 2021, 50, 0),
('M002', 'Affordable smartphone with basic features', 199.99, 'Moto E6', 2020, 200, 0),
('M003', 'High-end smartphone with powerful camera', 999.99, 'iPhone 12', 2020, 30, 0),
('M004', 'Mid-range phone with good performance', 499.99, 'OnePlus 8T', 2020, 100, 1),
('M005', 'Budget phone with essential features', 149.99, 'Nokia 2.4', 2021, 150, 0),
('M006', 'Compact smartphone with high performance', 749.99, 'Pixel 5', 2021, 75, 0),
('M007', 'Stylish phone with a great display', 549.99, 'Xiaomi Mi 11 Lite', 2021, 120, 0),
('M008', 'Durable phone with long battery life', 299.99, 'Samsung Galaxy A12', 2020, 80, 0),
('M009', 'Affordable phone with a large screen', 179.99, 'Realme C3', 2020, 140, 0),
('M010', 'High-end phone with excellent camera', 1099.99, 'iPhone 13 Pro', 2021, 45, 0),
('M011', 'Mid-range phone with fast charging', 399.99, 'Oppo Reno 5', 2021, 60, 0),
('M012', 'Gaming phone with top performance', 899.99, 'Asus ROG Phone 5', 2021, 25, 1),
('M013', 'Budget phone with a good battery', 159.99, 'Redmi 9A', 2021, 180, 0),
('M014', 'Flagship phone with premium features', 1199.99, 'Samsung Galaxy S21 U', 2021, 20, 0),
('M015', 'Affordable 5G phone with good specs', 349.99, 'OnePlus Nord N10', 2021, 90, 0),
('M016', 'Sleek design with powerful performance', 799.99, 'Sony Xperia 5 III', 2021, 40, 0),
('M017', 'Compact flagship with versatile camera', 1099.99, 'Google Pixel 6 Pro', 2021, 35, 0),
('M018', 'Premium phone with foldable display', 1799.99, 'Samsung Galaxy Z', 2021, 15, 0),
('M019', 'Budget-friendly smartphone with big battery', 249.99, 'Motorola Moto G', 2021, 100, 0),
('M020', 'Flagship killer with high-refresh-rate display', 549.99, 'OnePlus 9 Pro', 2021, 25, 1),
('M021', 'Compact device with impressive camera system', 699.99, 'iPhone 13 Mini', 2021, 50, 0),
('M022', 'Affordable 5G phone with stock Android', 399.99, 'Nokia X20', 2021, 80, 0),
('M023', 'Gaming powerhouse with RGB lighting', 999.99, 'ROG Phone 5s Pro', 2021, 20, 0),
('M024', 'Budget-friendly phone with large display', 169.99, 'Xiaomi Redmi Note 10', 2021, 120, 0),
('M025', 'Mid-range phone with quad-camera setup', 449.99, 'Realme GT Master', 2021, 60, 0),
('M026', 'Compact flagship with Hasselblad camera', 1299.99, 'OnePlus 9', 2021, 30, 0),
('M027', 'Stylish device with AMOLED display', 379.99, 'Samsung Galaxy A52', 2021, 90, 0),
('M028', 'Affordable gaming phone with powerful specs', 299.99, 'Poco X3 Pro', 2021, 70, 0),
('M029', 'Flagship device with powerful Snapdragon processor', 849.99, 'Xiaomi Mi 11', 2021, 40, 0),
('M030', 'Premium device with Leica quad-camera system', 1299.99, 'Huawei P50 Pro', 2021, 25, 0);



INSERT INTO Users (userId, password, fullName, role) VALUES
('u001', 123456, 'John Doe', 1),
('u002', 234567, 'Jane Smith', 0);

SELECT TOP (1000) [mobileId]
      ,[description]
      ,[price]
      ,[mobileName]
      ,[yearOfProduction]
      ,[quantity]
      ,[notSale]
  FROM [MyShop].[dbo].[Mobiles]

SELECT TOP (1000) [userId]
      ,[password]
      ,[fullName]
      ,[role]
  FROM [MyShop].[dbo].[Users]

SELECT fullName, role FROM Users WHERE userId = 'u001' AND password = '123456'
select password, fullName, role from Users where userId = ?

select [mobileId]
      ,[description]
      ,[price]
      ,[mobileName]
      ,[yearOfProduction]
      ,[quantity]
      ,[notSale]
	  from Mobiles
	  where [mobileId] = ? or [mobileName] = ?

DELETE FROM [dbo].[Mobiles]
      WHERE mobileId = ?

USE [MyShop]
GO

UPDATE [dbo].[Mobiles]
   SET [mobileId] = 'c001'
      ,[description] = '0'
      ,[price] = '1'
      ,[mobileName] = '2'
      ,[yearOfProduction] = '3'
      ,[quantity] = '4'
      ,[notSale] = 'False'
 WHERE mobileId = 'c001'
GO

USE [MyShop]
GO

INSERT INTO [dbo].[Mobiles]
           ([mobileId]
           ,[description]
           ,[price]
           ,[mobileName]
           ,[yearOfProduction]
           ,[quantity]
           ,[notSale])
     VALUES
           (?,
           ,?
           ,?
           ,?
           ,?
           ,?
           ,?)
GO

SELECT TOP (1000) [mobileId]
      ,[description]
      ,[price]
      ,[mobileName]
      ,[yearOfProduction]
      ,[quantity]
      ,[notSale]
  FROM [MyShop].[dbo].[Mobiles]

DELETE FROM Mobiles WHERE mobileId = ?
SELECT TOP (1000) [mobileId]
      ,[description]
      ,[price]
      ,[mobileName]
      ,[yearOfProduction]
      ,[quantity]
      ,[notSale]
  FROM [MyShop].[dbo].[Mobiles]
  WHERE price >= ? AND  price <= ?

UPDATE [dbo].[Mobiles]
   SET [quantity] = ?
 WHERE mobileId = ?