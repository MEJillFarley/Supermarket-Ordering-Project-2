# ETL Project-Supermarket Sales


We used 3 different datasets from the public platform Kaggle which provided us to the Supermarket Sales information. These datasets provided an in-depth look into the ordering and invoicing processes of a supermarket, as well as how consumers are engaging with it. This dataset can be used to analyze and gain insights into consumer purchasing behaviors and preferences at the store.  The data in the three files included the following information:

* *Invoices.csv* - 50,017 records which contain invoice data for orders made at the supermarket and if there were converted sales from those orders
* *OrderLeads.csv* - 100,000 records with information about orders at the super market
* *SalesTeam.csv* - 500 records containing information about the sales representatives 

The source of our datasets can be seen below:

https://www.kaggle.com/datasets/thedevastator/supermarket-ordering-invoicing-and-sales-analysi?select=Invoices.csv [Supermarket Ordering, Invoicing, and Sales]

## Extract

Used Pandas functions in Jupyter Notebook to load all three CSV files.

## Transformation
In order to transform the public data and use it in our study we performed the following:

1. Reviewed the files and transformed Invoices.csv and OrderLeads.csv into data frames
2. Split the date column into "year" and "month" columns for `order_leads_df'. This allowed us to perform aggregate functions and group by year and month.
3. Converted the month column from month number to a month name for `order_leads_df`
4. Calculated the conversion rate by month and transformed the result into data frame called `year_month_clean`
5. Calculated the conversion rate by company names and transformed the result into date frame called `company_name_df_clean`
6. Merged `order_leads_df` and `invoice_df` on OrderID and display new dataframe called `merged_df`(resulted in a 49,983 null value after merging the data frames). We were hoping to to spot patterns between the meal types amongst converted meals, but there was too much missing data for rows with converted orders. As a result, we didn't do any analysis on this dataframe. 
7. Split the date column into "year" and "month" columns for `invoice_df`
8. Converted the month columns from month number to month name for `invoice_df`
9. Coutned the numbers of meal and grouped by "Year", "Month", and "Type of Meal" for `invoice_df`
10. Save the groupby results into new dataframe called `invoice_clean_df`
11. Export `invoice_clean_df` to csv

## SQL Evaluation 
Create Supermarket_Ordering_Project_2 Database <br />
Import CSV DF Files & Created Tables in Postgres SQL <br />

Tables Created:  __OrderLeads, Invoices, SalesTeam, Invoice_Clean, Order_Leads_DF__ <br />
The following queries were created to evaluate the dataframes <br />

    1. Average Order Value by Company <br />
    2. Average Order Value by Month  <br />
    3. Average Order Value by Year <br />
    4. Average Order Value by Company/Per Year <br />
    5. Conversion Count by Company <br />
    6. Total Conversion Count over the Years <br />
    7. Sales Reps per Company <br />
    8. Average Order Value by Sales Rep <br />
    9. Average Order Value by Sales Rep on Converted Ordered <br />
    10. Average Meal Price <br />
    11. Average Meal Prices over the Years <br />
    
## Load
The last step was to transfer our final output into a Database. We created a database and respective table to match the columns from the final Panda's Data Frame using Postgres database using PG admin to store our original clean data sets. We reconnected to the database and generated additional tables for the data frames.

## Summary
Although there were some limitations to our findings due to the data available. We were able to address our hypothesis question in our inital project proposal listed in the ETL Project Final Write UP.

