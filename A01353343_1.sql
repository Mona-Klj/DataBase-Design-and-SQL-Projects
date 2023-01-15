USE Ch07_ConstructCo;
GO

/* 1 */
SELECT [EMP_NUM]
      ,[EMP_LNAME]
      ,[EMP_FNAME]
      ,[EMP_INITIAL]
  FROM [Ch07_ConstructCo].[dbo].[EMPLOYEE]
  WHERE [EMP_LNAME] LIKE 'Smith%';

/* 2 */
SELECT [EMP_NUM]
      ,[EMP_LNAME]
      ,[EMP_FNAME]
      ,[EMP_INITIAL]
      ,[EMP_HIREDATE]
      ,[JOB_CODE]
      ,[EMP_YEARS]
  FROM [Ch07_ConstructCo].[dbo].[EMPLOYEE]
  WHERE YEAR(EMP_HIREDATE) LIKE '1995%' OR
		YEAR(EMP_HIREDATE) LIKE '1996%' OR
		YEAR(EMP_HIREDATE) LIKE '1997%'
  ORDER BY [EMP_HIREDATE];

/* 3 */
SELECT [EMP_NUM]
      ,[EMP_LNAME]
      ,[EMP_FNAME]
      ,[EMP_INITIAL]
      ,[EMP_HIREDATE]
      ,[JOB_CODE]
      ,[EMP_YEARS]
  FROM [Ch07_ConstructCo].[dbo].[EMPLOYEE]
  WHERE YEAR(EMP_HIREDATE) < 1995
  ORDER BY [EMP_LNAME] ,[EMP_FNAME];

/* 4 */
SELECT DISTINCT [PROJ_NUM]
  FROM [Ch07_ConstructCo].[dbo].[ASSIGNMENT];

/* 5 */
SELECT [JOB_CODE] as [Job Code]
      ,[JOB_DESCRIPTION] as [Job Description]
      ,[JOB_CHG_HOUR]*8 as [Daily Rate]
  FROM [Ch07_ConstructCo].[dbo].[JOB]
  ORDER BY [JOB_DESCRIPTION];

/* 6 */
SELECT [ASSIGN_NUM]
      ,[ASSIGN_CHG_HR]
      ,[ASSIGN_HOURS]
      ,[ASSIGN_CHARGE]
  FROM [Ch07_ConstructCo].[dbo].[ASSIGNMENT]
  WHERE [ASSIGN_CHG_HR]> 80 AND [ASSIGN_HOURS]>5
  ORDER BY [ASSIGN_CHARGE] DESC;

/* 7 */
SELECT TOP 5 [ASSIGN_NUM]
      ,[ASSIGN_CHARGE]
  FROM [Ch07_ConstructCo].[dbo].[ASSIGNMENT]
  ORDER BY [ASSIGN_CHARGE] DESC;

/* 8 */
SELECT [JOB_CODE]
  FROM [Ch07_ConstructCo].[dbo].[JOB]
  WHERE [JOB_DESCRIPTION] IN ('Programmer', 'Systems Analyst', 'Database Designer', 'Applications Designer')
  ORDER BY [JOB_CODE];

/* 9 */
SELECT [JOB_CODE] as [Job Code]
      ,[JOB_DESCRIPTION] as [Job Description]
      ,[JOB_CHG_HOUR] as [Hourly Rate]
  FROM [Ch07_ConstructCo].[dbo].[JOB]
  WHERE [JOB_DESCRIPTION] LIKE '%Technician' OR 
        [JOB_DESCRIPTION] LIKE '%Engineer'
  ORDER BY [JOB_DESCRIPTION];

/* 10 */
SELECT [PROJ_NUM] as [Project Number]
      ,[PROJ_NAME] as [Project Name]
      ,[PROJ_VALUE]-[PROJ_BALANCE] as [Funds Remaining]
  FROM [Ch07_ConstructCo].[dbo].[PROJECT]
  ORDER BY [Funds Remaining];

--Part 2--

USE [AdventureWorks2019];
GO

/* 11. List all the femails designers and managers IDNumbers sort by IDNumebr */
SELECT [NationalIDNumber]
      ,[JobTitle]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  Where [Gender] like 'F' AND 
		[JobTitle] LIKE '%Designer%' OR 
		[JobTitle] LIKE '%Manager%'
  ORDER BY [NationalIDNumber];

/* 12. List product names that their reorder points are one of this list(600, 375, 75) sort by standard cost descending. */
SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[ReorderPoint]
      ,[StandardCost]
  FROM [AdventureWorks2019].[Production].[Product]
  WHERE [ReorderPoint] IN (600, 375, 75)
  ORDER BY [ReorderPoint]ASC, [StandardCost] DESC;

/* 13. List the name of USD and CAD Currency Code from Currency table */
SELECT [CurrencyCode]
      ,[Name]
  FROM [AdventureWorks2019].[Sales].[Currency]
  WHERE [CurrencyCode] LIKE 'USD' OR [CurrencyCode] LIKE 'CAD'
  ORDER BY [NAME];

/* 14. List the attached FirstName and LastName as new column by Full Name sorting by First Name*/
SELECT [FirstName]+' '+[LastName] as [Full Name]
  FROM [AdventureWorks2019].[Person].[Person]
  ORDER BY [FirstName] ASC;

/* 15. List the First and Last name of persons by B at the begining of their LastName and M at the begining of their FirstName sorted by LastName Descending. */
SELECT [FirstName]
      ,[LastName]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [LastName] LIKE 'B%' AND [FirstName] LIKE 'M%'
  ORDER BY [LastName] DESC;

/* 16. List the employees IDNumber, JobTitle and HireDate that they hired after 2010*/
SELECT [NationalIDNumber]
      ,[JobTitle]
      ,[HireDate]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  WHERE year([HireDate])>=2010
  ORDER BY [HireDate];

/* 17. List the maried employees by IDNumeber and JobTitle and sort by IDNumber*/
SELECT [NationalIDNumber]
      ,[JobTitle]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  WHERE [MaritalStatus] LIKE 'M'
  ORDER BY [NationalIDNumber];

/* 18. List the emploeesIDNumebr, JobTitle and Organization level that the Organization level
       is equal to 2 or 3 sorted by Organization level and job title*/
SELECT [NationalIDNumber]
      ,[JobTitle]
	  ,[OrganizationLevel]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  WHERE [OrganizationLevel] = '2' OR [OrganizationLevel] = '3'
  ORDER BY [OrganizationLevel], [JobTitle];
	 
/* 19. Which stores have the Bike word in their name sorted by name. */
SELECT [BusinessEntityID]
      ,[Name]
  FROM [AdventureWorks2019].[Sales].[Store]
  WHERE [Name] LIKE '%Bike%'
  ORDER BY [Name];

/* 20. List the employees IDNumebrs and BirthDate that born between 1980 to 1985 sort by BirthDate descending*/
SELECT [NationalIDNumber]
	  ,[BirthDate]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  WHERE year([BirthDate]) BETWEEN 1980 AND 1985
  ORDER BY [BirthDate] DESC;