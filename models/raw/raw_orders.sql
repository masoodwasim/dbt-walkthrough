/*  Create Table  by default it creates View without using config block */

/*
SELECT * 
FROM 
raw.globalmart.orders
*/

/*  Using Source */
SELECT 
* FROM
{{ source('globalmart', 'orders') }}


/* Run particular model use command - dbt run -s raw_orders */