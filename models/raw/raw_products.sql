/*  Create Table  by default it creates View without using config block */

/*
SELECT * 
FROM 
raw.globalmart.product

*/

/*  Using Source */
SELECT 
* FROM
{{ source('globalmart', 'product') }}

