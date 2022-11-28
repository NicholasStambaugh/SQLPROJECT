-- Cleansed DIM_Customers Table --
SELECT 
  c.customerkey AS CustomerKey, 
  --      ,[GeographyKey]
  --      ,[CustomerAlternateKey]
  --      ,[Title]
  c.firstname AS [First Name],  --cleaning data with better headers. Brackets for column names with spaces.
  --      ,[MiddleName]
  c.lastname AS [Last Name], 
  c.firstname + ' ' + lastname AS [Full Name], --combining names. More likely to make unique variable.
  -- Combined First and Last Name
  --      ,[NameStyle]
  --      ,[BirthDate]
  --      ,[MaritalStatus]
  --      ,[Suffix]
  c.gender AS [Gender Original],
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, --Used CASE to change c.gender objects to cleaner names.
  --      ,[EmailAddress]
  --      ,[YearlyIncome]
  --      ,[TotalChildren]
  --      ,[NumberChildrenAtHome]
  --      ,[EnglishEducation]
  --      ,[SpanishEducation]
  --      ,[FrenchEducation]
  --      ,[EnglishOccupation]
  --      ,[SpanishOccupation]
  --      ,[FrenchOccupation]
  --      ,[HouseOwnerFlag]
  --      ,[NumberCarsOwned]
  --      ,[AddressLine1]
  --      ,[AddressLine2]
  --      ,[Phone]
  c.datefirstpurchase AS DateFirstPurchase, 
  --      ,[CommuteDistance]
  g.city AS [Customer City] -- Left joined in Customer City from Geography Table to use for visualization later
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as c --renames DimCustomer to c 
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey 
ORDER BY 
  CustomerKey ASC -- Order List by CustomerKey