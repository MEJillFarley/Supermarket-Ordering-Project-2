--Create OrderLeads Table
CREATE TABLE OrderLeads (
    Order_Id VARCHAR   NOT NULL,
    Company_Id VARCHAR   NOT NULL,
	Company_Name VARCHAR   NOT NULL,
	Date Date NOT Null,
	Order_Value INT NOT Null,
	Converted INT Not Null,
    PRIMARY KEY (Order_id)
);

SELECT *
FROM OrderLeads
;
___________________________________________
--Create Invoices Table
CREATE TABLE Invoices (
    Order_Id VARCHAR   NOT NULL,
	Date Date NOT Null,
	Mean_Id VARCHAR   NOT NULL,
	Date_of_Meal Date NOT Null,
	Participants VARCHAR   NOT NULL,
	Meal_Price INT  NOT NULL,
	Type_of_Meal VARCHAR Not Null,
    PRIMARY KEY (Order_id)
);

SELECT *
FROM Invoices
;

___________________________________________
--Create SalesTeam Table
CREATE TABLE SalesTeam (
    Sales_Rep VARCHAR   NOT NULL,
    Sales_Rep_Id VARCHAR   NOT NULL,
	Company_Name VARCHAR   NOT NULL,
	Company_Id VARCHAR   NOT NULL,
	PRIMARY KEY (Sales_Rep_Id)
);

SELECT *
FROM SalesTeam
;

___________________________________________
--Create Clean Invoice Table
CREATE TABLE Invoice_Clean (
   Order_Id VARCHAR   NOT NULL,
	Date VARCHAR NOT NULL,
    Meal_Id VARCHAR   NOT NULL,
	Company_Id VARCHAR   NOT NULL,
	Date_of_Meal VARCHAR   NOT NULL,
	Participants VARCHAR NOT NULL,
	Meal_Price INT NOT NULL,
	Type_of_Meal VARCHAR NOT NULL,
	Year INT NOT NUll,
	Month VARCHAR
);

SELECT *
FROM Invoice_Clean
;

___________________________________________
-- Create Order_Leads_DF from dataframe

Create Table Order_Leads_df(
	Order_Id VARCHAR   NOT NULL,
	Company_Id VARCHAR   NOT NULL,
	Company_Name VARCHAR   NOT NULL,
	Date VARCHAR NOT NULL,
	Order_Value INT NOT NULL,
	Converted BOOLEAN NOT NULL,
	Year INT NOT NULL,
	Month VARCHAR NoT NULL
	
);

SELECT *
FROM Order_Leads_df
;

___________________________________________
-- Average Order Value by Company
SELECT 
	Order_Leads_df.Company_Name,
	avg(Order_Leads_df.Order_Value)
FROM Order_Leads_df
GROUP BY Order_Leads_df.Company_Name

___________________________________________
 --Average Order Value by Month

SELECT 
	Order_Leads_df.Company_Name,
	avg(Order_Leads_df.Order_Value),
	Order_Leads_df.Month
FROM Order_Leads_df
GROUP BY Order_Leads_df.Company_Name, Order_Leads_df.Month
ORDER BY Month ASC;



___________________________________________
-- Average Order Value by Year 
SELECT 
	Order_Leads_df.year,
	avg(Order_Leads_df.Order_Value)
FROM Order_Leads_df
GROUP BY Order_Leads_df.year
ORDER BY Year ASC;

___________________________________________
-- Average Order Value by Year (By Company)
SELECT 
	Order_Leads_df.Company_Name,
	avg(Order_Leads_df.Order_Value),
	Order_Leads_df.year
FROM Order_Leads_df
GROUP BY Order_Leads_df.Company_Name, Order_Leads_df.year
ORDER BY Year ASC;


___________________________________________
-- Conversion Count 
SELECT 
	COUNT('True'), Count(Order_Leads_df.converted),
	Order_Leads_df.Company_Name,
	Order_Leads_df.year
FROM Order_Leads_df
GROUP BY Order_Leads_df.Company_Name, Order_Leads_df.year
ORDER BY count(1) DESC

___________________________________________
-- Coversion Ratio 
SELECT 
	COUNT('True')/Count(Order_Leads_df.converted),
	Order_Leads_df.Company_Name,
	Order_Leads_df.year
FROM Order_Leads_df
GROUP BY Order_Leads_df.Company_Name, Order_Leads_df.year
ORDER BY count(1) DESC

___________________________________________

-- Total Conversion Count over the years
SELECT 
	COUNT('True')/ Count(Order_Leads_df.converted),
	Order_Leads_df.year
FROM Order_Leads_df
GROUP BY Order_Leads_df.year
ORDER BY Year DESC

___________________________________________
--Sales Reps per Company

SELECT SalesTeam.Sales_Rep_Id, COUNT(1)
FROM SalesTeam
GROUP BY SalesTeam.Company_Name
ORDER BY count(1) desc
___________________________________________

--Average Order Value by Sales Rep

SELECT 
	Order_Leads_df.Company_Name,
	Order_Leads_df.Company_Id,
	SalesTeam.Sales_Rep_Id,
	SalesTeam.Sales_Rep,
	avg(Order_Leads_df.Order_Value)
FROM SalesTeam
GROUP BY SalesTeam.Sales_Rep_Id

___________________________________________
--Average Order Value by Sales Rep on Converted ordered 
SELECT 
	COUNT('True'), Count(Order_Leads_df.converted),
	avg(Order_Leads_df.Order_Value),
	Order_Leads_df.year
FROM Order_Leads_df
GROUP BY Order_Leads_df.year
ORDER BY YEAR DESC


___________________________________________
--Highest Conversion Count Months
SELECT 
	COUNT('True'), Count(Order_Leads_df.converted),
	avg(Order_Leads_df.Order_Value),
	Order_Leads_df.month
FROM Order_Leads_df
GROUP BY Order_Leads_df.month
ORDER BY count(1) desc


___________________________________________
--Order Average Meal Price
SELECT 
	Invoice_Clean.Type_of_Meal,
	avg(Invoice_Clean.Meal_Price)
FROM Invoice_Clean
GROUP BY Invoice_Clean.Type_of_Meal

___________________________________________

--Average Meal Prices over the years 
SELECT 
	Invoice_Clean.Type_of_Meal,
	Invoice_Clean.Year,
	avg(Invoice_Clean.Meal_Price)
FROM Invoice_Clean
GROUP BY Invoice_Clean.Year, Invoice_Clean.Type_of_Meal
ORDER BY Year ASC;


___________________________________________




