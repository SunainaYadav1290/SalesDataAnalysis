
select * from dbo.customers$
SELECT count(*) FROM dbo.customers$;
select * from dbo.transactions$
select * from dbo.date$
SELECT * FROM dbo.transactions$ where market_code ='Mark002';
SELECT * from dbo.transactions$ where currency = 'INR'
SELECT t1.*, t2.* FROM dbo.transactions$ t1 INNER JOIN dbo.date$ t2
ON t1.order_date = t2.date WHERE t2.year = 2020;
/* Total Revenue for month of january*/
SELECT sum(t1.sales_amount*t1.sales_qty) as Total_Revenue,t1.order_date from   dbo.transactions$ t1  inner JOIN dbo.date$ t2 
ON t1.order_date = t2.date where t2.year = 2020  and 
(t1.currency='INR' or t1.currency='USD') and month(t1.order_date)=1
group by t1.order_date;
/*Total Sales in 2020 with market code Mark002i.e in mumbai */

with cte as(
SELECT t1.sales_amount  AS Total_Sales ,t2.year 
FROM dbo.transactions$ t1
 inner JOIN dbo.date$ t2 ON t1.order_date = t2.date
WHERE  t1.market_code ='Mark002')
select sum(Total_Sales) from cte where year = 2017