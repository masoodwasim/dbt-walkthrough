/*  Create Table  by default it creates View without using config block */
/*
SELECT * 
FROM 
raw.globalmart.customer
*/
/*  Using Source */
SELECT 
* FROM
{{ source('globalmart', 'customer') }}
