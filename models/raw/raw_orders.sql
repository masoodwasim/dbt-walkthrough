/*  Create Table  by default it creates View without using config block */
{{
    config(
        materialized='table'
    )
}}

SELECT * 
FROM 
raw.globalmart.orders


/* Run particular model use command - dbt run -s raw_orders */