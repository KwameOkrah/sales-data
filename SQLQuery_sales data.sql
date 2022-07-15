---Inspecting the Data
select * from [dbo].[sales_data_sample]

---Checking Unique Values
select distinct status from [dbo].[sales_data_sample]
select distinct YEAR_ID from [dbo].[sales_data_sample]
select distinct PRODUCTLINE from [dbo].[sales_data_sample]
select distinct COUNTRY from [dbo].[sales_data_sample]
select distinct DEALSIZE from [dbo].[sales_data_sample]
select distinct TERRITORY from [dbo].[sales_data_sample]

select distinct MONTH_ID from [dbo].[sales_data_sample]
where year_id = 2005


---Analysis
--- Grouping sales by productline

select PRODUCTLINE, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by PRODUCTLINE
order by 2 desc

---Grouping sales by year
select YEAR_ID, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by YEAR_ID
order by 2 desc

---Grouping sales by dealsize
select  DEALSIZE,  sum(sales) Revenue
from [dbo].[sales_data_sample]
group by  DEALSIZE
order by 2 desc

---The best month for sales in a specific year? How much was earned that month?

select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from [dbo].[sales_data_sample]
where YEAR_ID = 2004 
group by  MONTH_ID
order by 2 desc


---November seems to be the best month. What product do they sell in November?

select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from [dbo].[sales_data_sample]
where YEAR_ID = 2003 and MONTH_ID = 11
group by  MONTH_ID, PRODUCTLINE
order by 3 desc


---What city has the highest number of sales in a specific country

select city, sum (sales) Revenue
from [dbo].[sales_data_sample]
where country = 'Ireland'
group by city
order by 2 desc


---What is the best product in the United States?

select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from [dbo].[sales_data_sample]
where country = 'USA'
group by  country, YEAR_ID, PRODUCTLINE
order by 4 desc